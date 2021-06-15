require_dependency "cor1440_gen/concerns/controllers/efectos_controller"

module Cor1440Gen
  class EfectosController < Heb412Gen::ModelosController

    before_action :set_efecto,
      only: [:show, :edit, :update, :destroy] 
    load_and_authorize_resource class: Cor1440Gen::Efecto

    include Cor1440Gen::Concerns::Controllers::EfectosController

    def atributos_index
      [ :id, 
        :indicadorpf_id] +
        [ :orgsocial_ids=>[]] +
        [ :fecha_localizada,
          :nombre,
          :descripcion,
          :registradopor_id,
          :anexo_efecto,
          :aprobadodir
      ] 
    end

    def atributos_show
      r = atributos_index - [:anexo_efecto] +
        [
          :aprobadodir,
          :anexo_efecto
      ]
      return r
    end


    def atributos_form
      [ :indicadorpf_id ] +
        [ :orgsocial_ids=>[]] +
        [ :fecha_localizada,
          :nombre,
          :descripcion,
          :respuestafor,
          :porcentajeprog,
          :anexo_efecto,
          :aprobadodir
      ] 
    end

    def lista_params
      lista_params_cor1440_gen + [ 
        :fecha20_localizada,
        :fecha40_localizada,
        :fecha60_localizada,
        :fecha80_localizada,
        :fecha100_localizada,
        :observacionesdir 
      ]
    end

  end

end
