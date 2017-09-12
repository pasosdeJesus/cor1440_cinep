# encoding: UTF-8

class UsuariosController < Jn316Gen::UsuariosController

  def atributos_index
    [ "id",
      "nusuario",
      "nombres",
      "apellidos",
      "email",
      "oficina_id"
    ]
  end

  def atributos_form
    r = [ 
      "nusuario",
      "nombres",
      "apellidos",
      "descripcion",
      "rol",
      "oficina_id",
      "email",
    ]
    if can?(:manage, Sip::Grupo)
      r += ["sip_grupo"]
    end
    r += [
      "idioma",
      "encrypted_password",
      "fechacreacion_localizada",
      "fechadeshabilitacion_localizada",
      "failed_attempts",
      "unlock_token",
      "locked_at"
    ]
  end

end
