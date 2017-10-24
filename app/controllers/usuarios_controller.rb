# encoding: UTF-8

require 'jn316_gen/concerns/controllers/usuarios_controller'

class UsuariosController < Sip::ModelosController
  include Jn316Gen::Concerns::Controllers::UsuariosController

  def atributos_index
    [ "id",
      "nusuario",
      "nombres",
      "apellidos",
      "email",
      "oficina_id",
      "habilitado",
      "extension"
    ]
  end

  def atributos_form
    r = [ 
      "nusuario",
      "nombres",
      "apellidos",
      "descripcion"
    ]
    if can?(:manage, Sip::Grupo)
      r += ["rol"]
    end
    r += [
      "oficina_id",
      "extension",
      "email"
    ]
    if can?(:read, Sip::Grupo)
      r += ["sip_grupo"]
    end
    r += [
      "idioma",
      "telefonos",
      "encrypted_password",
      "no_modificar_ldap",
      "uidNumber",
      "fechacreacion_localizada",
      "fechadeshabilitacion_localizada",
      "failed_attempts",
      "unlock_token",
      "locked_at"
    ]
  end

#  def prefiltrar()
#    byebug
#    if params.nil?
#      params = ActionController::Parameters.new({
#         filtro: {
#          bushabilitado: 'SI'
#         }
#      })
#    elsif !params[:filtro]
#      params[:filtro] = ActionController::Parameters.new({
#        bushabilitado: 'SI'
#      })
#    elsif !params[:filtro][:bushabilitado]
#      params[:filtro][:bushabilitado] = 'SI'
#    end
#  end

  private

  def usuario_params
    p = params.require(:usuario).permit(
      :id, :nusuario, :password, 
      :nombres, :apellidos, :descripcion, :oficina_id,
      :rol, :idioma, :email, :encrypted_password, 
      :telefonos, :extension,
      :no_modificar_ldap, :uidNumber,
      :fechacreacion_localizada, :fechadeshabilitacion_localizada, 
      :reset_password_token, 
      :reset_password_sent_at, :remember_created_at, :sign_in_count, 
      :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, 
      :failed_attempts, :unlock_token, :locked_at,
      :last_sign_in_ip, :etiqueta_ids => [],
      :sip_grupo_ids => []
    )
    return p
  end

end
