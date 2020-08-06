require 'net/http'
require 'json'

class BusqsunifController < Heb412Gen::ModelosController
  helper ::ApplicationHelper

  before_action :set_busqunif, 
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource class: ::Busqunif

  def clase
    "::Busqunif"
  end

  def atributos_index
    [ 
      :idurl,
      :fecha_localizada,
      :departamento,
      :municipio,
      :descripcion
    ] 
  end

  def index_reordenar(registros)
    return registros.reorder(fecha: :desc, 
                             departamento: :asc,
                             municipio: :asc,
                             descripcion: :asc)
  end

  def new_modelo_path(o)
    return new_busqunif_path()
  end

  def genclase
    return 'F'
  end

  def vistas_manejadas
    ['Busqunif']
  end

  def index(c = nil)
    if c == nil
      c = ::Busqunif.all
    end
    @titulo = 'Consulta unificada'
    if params[:filtro]
      ::Busqunif.all.delete_all
      cls = Ls.all
      cacp = Acp.all
      finisivel = ''
      if params[:filtro][:fechaini] && 
          params[:filtro][:fechaini].strip.length > 0 
          
        fini = Sip::FormatoFechaHelper.fecha_local_estandar(
          params[:filtro][:fechaini])
        cls = cls.where('fecha >= ?', fini)
        cacp = cacp.where('ffin >= ?', fini)
        finisivel = "&filtro%5Bfechaini%5D=#{fini}"
      end
      ffinsivel = ''
      if params[:filtro][:fechafin] && params[:filtro][:fechafin].to_i > 0 && 
          valida
        ffin = params[:filtro][:fechafin]
        cls = cls.where('fecha <= ?', ffin)
        cacp = cacp.where('fini <= ?', ffin)
        ffinsivel = "&filtro%5Bfechafin%5D=#{ffin}"
      end
      depsivel = ''
      munsivel = ''
      if params[:filtro][:departamento_id].to_i > 0 && Sip::Departamento.
          where(id: params[:filtro][:departamento_id].to_i).count > 0
        did = params[:filtro][:departamento_id].to_i
        cls = cls.joins(:lsdep).where('lsdep.departamento_id=?', did)
        cacp = cacp.joins(:lugar).where('acplugar.departamento_id=?', did)
        depsivel = "&filtro%5Bdepartamento_id%5D=#{did}"
        if params[:filtro][:municipio_id].to_i > 0 && Sip::Municipio.
            where(id: params[:filtro][:municipio_id].to_i).count > 0
          mid = params[:filtro][:municipio_id].to_i
          cls = cls.joins(:lsdep).where('lsdep.departamento_id=?', did).
            joins('JOIN lsmun ON lsmun.lsdep_id=lsdep.id').
            where('lsmun.municipio_id=?',mid)
          cacp = cacp.joins(:lugar).where('acplugar.departamento_id=?', did).
            where('acplugar.municipio_id=?', mid)
          munsivel = "&filtro%5Bmunicipio_id%5D=#{mid}"
        end
      end
      if params[:filtro][:colectivo] && 
          params[:filtro][:colectivo].strip.length > 0
        col = params[:filtro][:colectivo].strip
        cls = cls.where(
          "unaccent(orgconvocante) LIKE '%' || unaccent(?) || '%' " +
          "OR unaccent(dirig1) LIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(dirig2) LIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(dirig3) LIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(paritici1) LIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(paritici2) LIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(paritici3) LIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(entidad1) LIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(entidad2) LIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(entidad3) LIKE '%' || unaccent(?) || '%'",
          col, col, col, col, col,
          col, col, col, col, col)
        cacp = cacp.joins(:actor).where('acpactor.actor3=?', did)
        cacp = cls.where(
          "unaccent(orgconvocante) LIKE '%' | unaccent(?) | '%' " +
          "OR unaccent(dirig1) LIKE '%' | unaccent(?) | '%'" +
 
      end
      err = ""
      if cls.count > 2000 
        err << "#{cls.count} luchas sociales, refinar para examinar en detalle menos de 2000. "
      end
      if cacp.count > 2000 
        err << "#{cacp.count} acciones colectivas por la paz, refinar para examinar en detalle menos de 2000. "
      end 
      rj = []
      if err == ''
        sivelcons = "https://base.nocheyniebla.org/casos.json?utf8=%E2%9C%93&filtro%5Bq%5D=#{depsivel}#{munsivel}&filtro%5Binc_ubicaciones%5D=2#{finisivel}#{ffinsivel}filtro%5Binc_fecha%5D=1&filtro%5Borden%5D=fecha&filtro%5Binc_memo%5D=2&filtro%5Bdisgenera%5D=reprevista.json&idplantilla=reprevista&commit=Enviar"
        puts "* Solicitando #{sivelcons}"
        uri = URI(sivelcons)
        response = Net::HTTP.get(uri)
        j = JSON.parse(response)
        rj = j.to_a.map do |x|
          x[1].merge({id: x[0]})
        end
        idsls = cls.pluck(:id)
        if idsls.count > 0
          ::Busqunif.connection.execute(
            "INSERT INTO busqunif (base, idbase, url, " + 
            "fecha, departamento, municipio, descripcion) " + 
            "(SELECT 'LS', id, 'https://crecer.cinep.org.co/lss/' || id, " +
            "fecha, '', '', descripcion " +
            "FROM ls WHERE id in (#{idsls.join(', ')}))")
        end
        idsacp = cacp.pluck(:id)
        if idsacp.count > 0
          ::Busqunif.connection.execute(
            "INSERT INTO busqunif (base, idbase, url, " +
            "fecha, departamento, municipio, descripcion) " +
            "(SELECT 'ACP', id, 'https://crecer.cinep.org.co/acps/' || id, " +
            "fini, '', '', descripcion " +
            "FROM acp WHERE id IN (#{idsacp.join(", ")}))")
        end
        # https://stackoverflow.com/questions/25785575/how-to-parse-json-using-json-populate-recordset-in-postgres#26742370
        if rj.count > 0
          ::Busqunif.connection.execute(
            "INSERT INTO busqunif (base, idbase, url, "+
            "fecha, departamento, municipio, descripcion) " +
            "(SELECT 'BD', id, 'https://base.nocheyniebla.org/casos/' || id, " +
            "fecha, departamento, municipio, descripcion " +
            "FROM json_populate_recordset(null::record, " +
            "'#{rj.to_json}') AS (id int, departamento varchar(256), " +
            "municipio varchar(256), fecha date, descripcion varchar(6000)))")
        end

        c = ::Busqunif.all
        byebug
        super(c)
        return
      else
        byebug
        @registros = ::Busqunif.where('false')
        render 'index', notice: err, layout: 'application'
        return
      end
    end # params[:filtro]
    byebug
    super(c)
  end

  private

  def set_busqunif
    @registro = @basica = @busqunif = ::Busqunif.find(
      Busqunif.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def busqunif_params
    params.require(:busqunif).permit([
      :base,
      :id,
      :fecha,
      :departamento,
      :municipio,
      :actororgsocial,
      :descripcion
    ])
  end
end
