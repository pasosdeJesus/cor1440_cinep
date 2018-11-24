# encoding: UTF-8

#module Cor1440Gen
  class PprogstindController < Sip::ModelosController

    # GET /pprogtinds/new
    def new
      if params[:tipoindicador_id]
        @pprogtind = ::Cor1440Gen::Pprogtind.new
        @pprogtind.tipoindicador_id = params[:tipoindicador_id]
        @pprogtind.pregunta = "N"
        if @pprogtind.save(validate: false)
          respond_to do |format|
            format.js { render text: @pprogtind.id.to_s }
            format.json { render json: @pprogtind.id.to_s, status: :created }
            format.html { render inline: 'No implementado', 
                          status: :unprocessable_entity }
          end
        else
          render inline: 'No implementado', status: :unprocessable_entity 
        end
      else
        render inline: 'Falta id de tipoindicador', 
          status: :unprocessable_entity 
      end
    end

    def destroy
      if params[:id]
        @pprogtind = ::Cor1440Gen::Pprogtind.find(params[:id])
        @pprogtind.destroy
        respond_to do |format|
          format.html { render inline: 'No implementado', 
                        status: :unprocessable_entity }
          format.json { head :no_content }
        end
      end
    end

  end
#end
