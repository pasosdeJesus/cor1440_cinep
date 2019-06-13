# encoding: UTF-8

module Cor1440Gen

  class EfectosController < Sip::ModelosController
    helper ::ApplicationHelper

    before_action :set_efecto, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Cor1440Gen::Efecto

    def clase
      "Cor1440Gen::Efecto"
    end

    def atributos_index
      [ "id", 
        "indicadorpf_id"] +
        [ :actorsocial_ids=>[]] +
        [ "fecha_localizada",
          "nombre",
          "descripcion",
          "registradopor_id",
          "anexo_efecto"
      ] 
    end

    def atributos_show
      r = atributos_index - ["anexo_efecto"] +
        [
          :porcentajeprog,
          :anexo_efecto
      ]
      return r
    end


    def atributos_form
      [ "indicadorpf_id"] +
        [ :actorsocial_ids=>[]] +
        [ "fecha_localizada",
          "nombre",
          "descripcion",
          "efecto_valorcampotind",
          "porcentajeprog",
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
      authorize! :edit, Cor1440Gen::Efecto
      @registro = @efecto = Cor1440Gen::Efecto.find(params[:id])
      if @registro.registradopor_id.nil?
        @registro.registradopor_id = current_usuario.id
        @registro.save!(validate: false)
      end
      if params['indicadorpf_id'] && params['indicadorpf_id'].to_i > 0
        @registro.indicadorpf_id = params['indicadorpf_id'].to_i
        @registro.valorcampotind = []
      end
      asegura_camposdinamicos(@registro)
      render layout: 'application'
    end

    def destroy(mens = "", verifica_tablas_union=true)
      @registro.anexo_efecto = []
      @registro.actorsocial = []
      @registro.valorcampotind = []
      destroy_gen(mens, verifica_tablas_union)
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
      @registro = @efecto = Cor1440Gen::Efecto.find(params[:id].to_i)
    end

    def lista_params
      atributos_form + [:id] - ["efecto_valorcampotind", "anexo_efecto" ] + 
        [ 
          :fecha20_localizada,
          :fecha40_localizada,
          :fecha60_localizada,
          :fecha80_localizada,
          :fecha100_localizada,
          anexo_efecto_attributes: [ 
            :id,
            :efecto_id,
            :_destroy,
            sip_anexo_attributes: [ :id, :descripcion, :adjunto, :_destroy ] 
      ],
        efecto_valorcampotind_attributes: [
          :id,
          :efecto_id,
          :_destroy,
          valorcampotind_attributes: [
            :id,
            :campotind_id,
            :valor,
            :_destroy
      ]
      ]
      ]
    end

    # No confiar parametros a Internet, sólo permitir lista blanca
    def efecto_params
      params.require(:efecto).permit(lista_params)
    end

  end

end
