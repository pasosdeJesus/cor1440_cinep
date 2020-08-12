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
      :descripcion,
      :fuentes,
      :fechafuentes
    ] 
  end

  def index_reordenar(registros)
    return registros.reorder(fecha: :desc, 
                             departamento: :asc,
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
      parsivel = {
        inc_ubicaciones: 2,
        inc_fecha: 1,
        orden: 'fecha',
        inc_memo: 2,
        disgenera: 'reprevista.json'
      }
      if params[:filtro][:fechaini] && 
          params[:filtro][:fechaini].strip.length > 0 
          
        fini = Sip::FormatoFechaHelper.fecha_local_estandar(
          params[:filtro][:fechaini])
        cls = cls.where('fecha >= ?', fini)
        cacp = cacp.where('ffin >= ?', fini)
        parsivel[:fechaini] = fini
      end
      if params[:filtro][:fechafin] && params[:filtro][:fechafin].to_i > 0
        ffin= Sip::FormatoFechaHelper.fecha_local_estandar(
          params[:filtro][:fechafin])
        cls = cls.where('fecha <= ?', ffin)
        cacp = cacp.where('fini <= ?', ffin)
        parsivel[:fechafin] = ffin
      end
      if params[:filtro][:departamento_id].to_i > 0 && Sip::Departamento.
          where(id: params[:filtro][:departamento_id].to_i).count > 0
        did = params[:filtro][:departamento_id].to_i
        cls = cls.joins(:lsdep).where('lsdep.departamento_id=?', did)
        cacp = cacp.joins(:lugar).where('acplugar.departamento_id=?', did)
        parsivel[:departamento_id] = did
        if params[:filtro][:municipio_id].to_i > 0 && Sip::Municipio.
            where(id: params[:filtro][:municipio_id].to_i).count > 0
          mid = params[:filtro][:municipio_id].to_i
          cls = cls.joins(:lsdep).where('lsdep.departamento_id=?', did).
            joins('JOIN lsmun ON lsmun.lsdep_id=lsdep.id').
            where('lsmun.municipio_id=?',mid)
          cacp = cacp.joins(:lugar).where('acplugar.departamento_id=?', did).
            where('acplugar.municipio_id=?', mid)
          parsivel[:municipio_id] = mid
        end
      end
      if params[:filtro][:colectivo] && 
          params[:filtro][:colectivo].strip.length > 0
        col = params[:filtro][:colectivo].strip
        cls = cls.where(
          "unaccent(orgconvocante) ILIKE '%' || unaccent(?) || '%' " +
          "OR unaccent(dirig1) ILIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(dirig2) ILIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(dirig3) ILIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(partici1) ILIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(partici2) ILIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(partici3) ILIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(entidad1) ILIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(entidad2) ILIKE '%' || unaccent(?) || '%'" +
          "OR unaccent(entidad3) ILIKE '%' || unaccent(?) || '%'",
          col, col, col, col, col,
          col, col, col, col, col)
        cacp = cacp.joins(:actor).
          joins('JOIN acpactor2 ON acpactor.actor2_id = acpactor2.id').
          joins('JOIN acpactor1 ON acpactor2.actor1_id = acpactor1.id').
          where(
          "unaccent(acpactor.actor3) ILIKE '%' || unaccent(?) || '%' " +
          "OR unaccent(acpactor2.nombre) ILIKE '%' || unaccent(?) || '%' " +
          "OR unaccent(acpactor1.nombre) ILIKE '%' || unaccent(?) || '%' ",
        col, col, col)
        parsivel[:q] = col
      end
      err = ""
      if cls.count > 2000 
        err << "#{cls.count} luchas sociales, refinar para examinar en detalle menos de 2000. "
      end
      if cacp.count > 2000 
        err << "#{cacp.count} acciones colectivas por la paz, refinar para examinar en detalle menos de 2000. "
      end 
      rj = []
      sivelcons = "https://base.nocheyniebla.org/casos.json?" +
        "utf8=%E2%9C%93&" +
        parsivel.to_param('filtro') + 
        "&idplantilla=reprevista&commit=Enviar"
      puts "* Solicitando #{sivelcons}"
      uri = URI(sivelcons)
      response = Net::HTTP.get(uri)
      j = JSON.parse(response)
      @bd_cuenta = j.count
      if j['status'] && j['status'] == 500
        err << "Más de 2000 casos retornados por Banco de Datos"
      end

      if err == ""
        j.each do |idbd, vs|
          nr = ::Busqunif.new(
            base: 'BD',
            idbase: idbd.to_i,
            url: 'https://base.nocheyniebla.org/casos/' + idbd.to_i.to_s,
            fecha: vs['fecha'],
            departamento: vs['departamento'],
            municipio: vs['municipio'],
            descripcion: vs['descripcion'],
            fuentes: '',
            fechafuentes: nil
          )
          if nr.valid?
            nr.save!
          end
        end
        @ls_cuenta = cls.count
        idsls = cls.pluck(:id)
        if idsls.count > 0
          if can? :edit, ::Ls
            cdescripcion = 'descripcion'
          else
            cdescripcion = '\'\''
          end
          ::Busqunif.connection.execute(
            "INSERT INTO busqunif (base, idbase, url, " + 
            "fecha, departamento, descripcion, fuentes, fechafuentes) " + 
            "(SELECT 'LS', id, '" + main_app.lss_url + "/' || id, " +
            "fecha, ARRAY_TO_STRING(ARRAY(SELECT DISTINCT sip_departamento.nombre " +
            "FROM lsdep JOIN sip_departamento " +
            "ON lsdep.departamento_id=sip_departamento.id " +
            "WHERE lsdep.ls_id=ls.id), '; '), " +
            "#{cdescripcion}, " +
            "fuente, " +
            "ffuente " +
            "FROM ls WHERE id in (#{idsls.join(', ')}))")
        end
        @acp_cuenta = cacp.count
        idsacp = cacp.pluck(:id)
        if idsacp.count > 0
          ::Busqunif.connection.execute(
            "INSERT INTO busqunif (base, idbase, url, " +
            "fecha, departamento, descripcion, fuentes, fechafuentes) " +
            "(SELECT 'ACP', id, '" + main_app.acps_url + "/' || id, " +
            "fini, " +
            "ARRAY_TO_STRING(ARRAY(SELECT DISTINCT sip_departamento.nombre " +
            "  FROM acplugar JOIN sip_departamento " +
            "  ON acplugar.departamento_id=sip_departamento.id " +
            "  WHERE acplugar.acp_id=acp.id), '; ')," +
            "descripcion, " +
            "ARRAY_TO_STRING(ARRAY(SELECT fuente FROM acpfuente " +
            "  WHERE acpfuente.acp_id=acp.id), '; ')," +
            "ARRAY_TO_STRING(ARRAY(SELECT ffuente::text FROM acpfuente " +
            "  WHERE acpfuente.acp_id=acp.id), '; ') " +
            "FROM acp WHERE id IN (#{idsacp.join(", ")}))")
        end
        # https://stackoverflow.com/questions/25785575/how-to-parse-json-using-json-populate-recordset-in-postgres#26742370
        # Metodo interesante pero con problemas con ' pues no escapa
        #if rj.count > 0
        #  ::Busqunif.connection.execute(
        #    "INSERT INTO busqunif (base, idbase, url, "+
        #    "fecha, departamento, municipio, descripcion) " +
        #    "(SELECT 'BD', id, 'https://base.nocheyniebla.org/casos/' || id, " +
        #    "fecha, departamento, municipio, descripcion " +
        #    "FROM json_populate_recordset(null::record, " +
        #    "'#{rj.to_json}') AS (id int, departamento varchar(256), " +
        #    "municipio varchar(256), fecha date, descripcion varchar(6000)))")
        #end
      else
        flash.now[:notice] = err
        @registros = ::Busqunif.where('false')
        render 'index', layout: 'application'
        return
      end
      c = ::Busqunif.all
    end
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
