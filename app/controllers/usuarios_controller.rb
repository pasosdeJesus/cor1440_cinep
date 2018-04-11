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
      "extension",
      "grupos",
      "habilitado",
    ]
  end

  def atributos_form
    r = []
    if can?(:create, ::Usuario)
      r += [ 
        "nusuario",
        "persona",
        #"nombres",
        #"apellidos",
        "descripcion"
      ]
    end
    if can?(:manage, ::Usuario)
      r += ["rol"]
    end
    if can?(:edit, ::Usuario)
      r += [
        "oficina_id",
        "extension",
        "telefonos",
      ]
    end
    if can?(:create, ::Usuario)
      r += [
        "email"
      ]
    end
    if can?(:create, ::Usuario)
      r += [
        "sip_grupo",
        "direccionresidencia",
        "numhijos",
        "numhijosmen12",
        "fechacreacion_localizada",
        "fechadeshabilitacion_localizada",
      ]
    end
    if can?(:manage, ::Usuario)
      r += [
        "idioma",
        "encrypted_password",
        "no_modificar_ldap",
        "uidNumber",
        "failed_attempts",
        "unlock_token",
        "locked_at"
      ]
    end
    return r
  end

  def medio_create(usuario)
    usuario.nombres = params[:usuario][:persona_attributes][:nombres]
    usuario.apellidos = params[:usuario][:persona_attributes][:apellidos]
  end

  def medio_update(usuario)
    medio_create(usuario)
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
      :current_sign_in_at, 
      :current_sign_in_ip, 
      :descripcion, 
      :direccionresidencia, 
      :email, 
      :encrypted_password, 
      :extension,
      :failed_attempts, 
      :fechacreacion_localizada, 
      :fechadeshabilitacion_localizada, 
      :id, 
      :idioma, 
      :last_sign_in_at, 
      :last_sign_in_ip, 
      :locked_at,
      :no_modificar_ldap, 
      :numhijos, 
      :numhijosmen12, 
      :nusuario, 
      :oficina_id,
      :password, 
      :reset_password_token, 
      :reset_password_sent_at, 
      :remember_created_at, 
      :rol, 
      :sign_in_count, 
      :telefonos, 
      :uidNumber,
      :unlock_token, 
      :etiqueta_ids => [],
      :persona_attributes => [
        :apellidos,
        :anionac,
        :dianac,
        :id, 
        :id_clase,
        :id_departamento,
        :id_municipio,
        :id_pais,
        :labdepartamento_id,
        :labmunicipio_id,
        :lugardocumento,
        :mesnac,
        :nombres,
        :numerodocumento,
        :numhijos,
        :numhijosmen12,
        :sexo,
        :tdocumento_id
      ],
      :sip_grupo_ids => []
    )
    return p
  end

end
