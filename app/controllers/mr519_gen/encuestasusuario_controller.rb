
require_dependency "mr519_gen/concerns/controllers/encuestasusuario_controller"

module Mr519Gen
  class EncuestasusuarioController < Sip::ModelosController
    include Mr519Gen::Concerns::Controllers::EncuestasusuarioController

    def resultados_antes_presentar(formulario_id)
      if Planencuesta.where(formulario_id: formulario_id).count == 0
        pe = Planencuesta.create(formulario_id: formulario_id)
        pe.save!
      else
        pe = Planencuesta.where(formulario_id: formulario_id).take
      end

      @enlace_externo = main_app.externoresultado_encuestausuario_url(pe.adurl)
    end

    def externoresultado
      if !params || !params[:adurl]
        render inline: 'Falta parámetro adurl'
        return
      end
      adurl = params[:adurl][0..31]
      pe = Planencuesta.where(adurl: adurl)
      if pe.count != 1
        render inline: 'No hay resultado con el adurl dado'
        return
      end
      fid = pe.take.formulario_id
      @registros = Encuestausuario.joins(:respuestafor).
        where("mr519_gen_respuestafor.formulario_id" => fid)
      @titulo = ''
      @consolidado = []
      menserr = ''
      if !Mr519Gen::ApplicationHelper.analiza_respuestas(
          @registros.map(&:respuestafor_id),
          @titulo,
          @consolidado,
          menserr)
        render inline: menserr
        return
      end
      resultados_antes_presentar(fid)
      @usuarios = @registros.map(&:usuario)
      render 'externoresultado', layout: 'externo'
    end

  end
end
