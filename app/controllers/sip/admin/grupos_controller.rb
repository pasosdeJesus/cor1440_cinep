# encoding: UTF-8

require 'jn316_gen/concerns/controllers/grupos_controller'

module Sip
  module Admin
    class GruposController < Sip::Admin::BasicasController
      include Jn316Gen::Concerns::Controllers::GruposController
      load_and_authorize_resource  class: Sip::Grupo

      def atributos_index
        [ "id", "nombre", "cn", "gidNumber", "ultimasincldap_localizada" ] +
          [ :subgrupo_ids => [] ] +
          ["observaciones", "fechacreacion", "fechadeshabilitacion" ]
      end

      def atributos_show
        [ "id", "nombre", "cn", "gidNumber", "ultimasincldap_localizada" ] +
          [ :usuario_ids => [] ] +
          [ :subgrupo_ids => [] ] +
          ["observaciones", "fechacreacion", "fechadeshabilitacion" ]
      end

      def atributos_form
        [ "nombre", "cn", "gidNumber", "ultimasincldap_localizada" ] +
          [ :usuario_ids => [] ] +
          [ :subgrupo_ids => [] ] +
          ["observaciones", 
           "no_modificar_ldap",
           "fechacreacion_localizada", 
           "fechadeshabilitacion_localizada" ]
      end

    end
  end
end
