# encoding: UTF-8

class EfectosController < Sip::ModelosController
  helper ::ApplicationHelper

  before_action :set_efecto, 
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource class: ::Efecto

  def clase
    "::Efecto"
  end

  def atributos_index
    [ "id", 
      "indicadorpf_id"] +
    [ :actor_ids=>[]] +
    [ "fecha_localizada",
      "registradopor_id",
      "anexo_efecto"
    ] 
  end

  def atributos_form
    [ "indicadorpf_id"] +
    [ :actor_ids=>[]] +
    [ "fecha_localizada",
       "efecto_valorcampotind",
       "anexo_efecto"
    ] 
  end

  def new
    @registro = clase.constantize.new
    @registro.fecha = Date.today
    if params[:indicadorpf_id] && params[:indicadorpf_id].to_i > 0
      @registro.indicadorpf_id = params[:indicadorpf_id].to_i
    end
    @registro.registradopor_id = current_usuario.id
    @registro.save!(validate: false)
    redirect_to main_app.edit_efecto_path(@registro)
  end

  def asegura_camposdinamicos(efecto)
    if efecto.indicadorpf && efecto.indicadorpf.tipoindicador
        ci = efecto.indicadorpf.tipoindicador.campotind.map(&:id).sort
        cd = efecto.valorcampotind.map(&:campotind_id).sort
        if ci != cd
          if cd == []
            efecto.indicadorpf.tipoindicador.campotind.each do |cti|
              nr = Cor1440Gen::Valorcampotind.new
              nr.campotind_id = cti.id
              nr.valor = ''
              if nr.save
                ne = ::EfectoValorcampotind.new
                ne.efecto_id = efecto.id
                ne.valorcampotind_id = nr.id
                if !ne.save
                  # No pudo guardar ne
                end
              else
                # No pudo guardar nr
              end
            end
          else
            # Inconsistencia
          end
        end 
    end
  end

  def edit
    authorize! :edit, ::Efecto
    @registro = ::Efecto.find(params[:id])
    if params['indicadorpf_id'] && params['indicadorpf_id'].to_i > 0
      @registro.indicadorpf_id = params['indicadorpf_id'].to_i
      @registro.valorcampotind = []
    end
    asegura_camposdinamicos(@registro)
    render layout: 'application'
  end

  def index_reordenar(registros)
    return registros.reorder(fecha: :desc, indicadorpf_id: :asc)
  end

  def new_modelo_path(o)
    return new_efecto_path()
  end

  def genclase
    return 'M'
  end

  private

  def set_efecto
    @registro = @efecto = ::Efecto.find(
      Efecto.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def efecto_params
    params.require(:efecto).permit(
      :id, 
      :indicadorpf_id,
      :fecha_localizada,
      :actor_ids => [],
      :anexo_efecto_attributes => [
        :id,
        :efecto_id,
        :_destroy,
        :sip_anexo_attributes => [
          :id, :descripcion, :adjunto, :_destroy
        ]
      ],
      :efecto_valorcampotind_attributes => [
        :id,
        :efecto_id,
        :_destroy,
        :valorcampotind_attributes => [
          :id,
          :campotind_id,
          :valor,
          :_destroy
        ]
      ],

    )
  end
end
