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
      "sip_grupo_ids",
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

  def atributos_show
    r = []
    if can?(:read, ::Usuario)
      r += [ 
        "nusuario",
        "id",
        "nombres",
        "apellidos",
        "gruposesp",
        "grupos",
        "oficina_id",
        "extension",
        "email",
      ]
    end
    if can?(:create, ::Usuario)
      r += [
        "telefonos",
        "tdocumento",
        "numerodocumento",
        "lugardocumento",
        "fechanacb",
        "sexonac",
        "lugarnacimiento",
        "direccionresidencia",
        "numhijos",
        "numhijosmen12",
        "niveleducacion",
        "profesion",
        "areaestudios",
        "empresaps",
        "fondopensiones",
        "cajacompensacion",
        "numerocontrato",
        "fechaini_localizada",
        "fechafin_localizada",
        "tipocontrato",
        "cargo_id",
        "perfilprofesional_id",
        "salario",
        "salarioanterior",
        "ciudadresidencia",
        "ciudadlabora",
        "procesogh",
        "tiponomina",
        "vinculaciones",
        "anexo_usuario"
      ]
    end
    if can?(:manage, ::Usuario)
      r += [
        "rol",
        "idioma",
        "encrypted_password",
        "uidNumber",
        "fechacreacion_localizada",
        "fechadeshabilitacion_localizada",
        "failed_attempts",
        "unlock_token",
        "locked_at"
      ]
    end
    return r
  end
 
  def atributos_show_json
    atributos_show + ['tipocontrato_id', 'perfilprofesional_id']
  end

  def index_reordenar(c)
    if !params || !params[:filtro] || !params[:filtro][:bushabilitado]
      c = c.where("usuario.fechadeshabilitacion IS NULL")
    end
    c = c.reorder([:apellidos])
    return c
  end

  def medio_create(usuario)
    usuario.nombres = params[:usuario][:persona_attributes][:nombres]
    usuario.apellidos = params[:usuario][:persona_attributes][:apellidos]
  end

  def medio_update(usuario)
    medio_create(usuario)
  end

  def prefiltrar
  end

  private

  def usuario_params
    p = params.require(:usuario).permit(
      :cajacompensacion_id,
      :cargo_id,
      :current_sign_in_at, 
      :current_sign_in_ip, 
      :descripcion, 
      :direccionresidencia, 
      :email, 
      :empresaps_id,
      :encrypted_password, 
      :extension,
      :failed_attempts, 
      :fechacreacion_localizada, 
      :fechadeshabilitacion_localizada, 
      :fondopensiones_id,
      :id, 
      :idioma, 
      :last_sign_in_at, 
      :last_sign_in_ip, 
      :locked_at,
      :niveleducacion_id,
      :no_modificar_ldap, 
      :numhijos, 
      :numhijosmen12, 
      :nusuario, 
      :oficina_id,
      :password, 
      :perfilprofesional_id,
      :profesion_id,
      :reset_password_token, 
      :reset_password_sent_at, 
      :remember_created_at, 
      :rol, 
      :sign_in_count, 
      :telefonos, 
      :uidNumber,
      :unlock_token, 
      :etiqueta_ids => [],
      :anexo_usuario_attributes => [
        :id,
        :proyectofinanciero_id,
        :_destroy,
        :sip_anexo_attributes => [
          :adjunto, 
          :descripcion, 
          :id, 
          :_destroy
        ]
      ],
      :contrato_attributes => [
        :ciudadresidencia,
        :ciudadlabora,
        :fechaini_localizada,
        :fechafin_localizada,
        :id,
        :numero,
        :salario,
        :salarioanterior,
        :tipocontrato_id
      ],
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
      :vinculacion_attributes => [
        :fechaini_localizada,
        :fechafin_localizada,
        :id,
        :observaciones,
        :_destroy
      ],
      :sip_grupo_ids => []
    )
    return p
  end

end
