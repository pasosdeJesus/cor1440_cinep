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

      def crear_dirac
        @grupo = Sip::Grupo.find(params[:id])

        prob = ''
        Jn316Gen::DiracHelper.conectar do |ldap|
          gw = 'Grupo' + @grupo.cn
          Jn316Gen::DiracHelper.agregar_grupo(ldap, gw, prob)
          @grupo.usuario.each do |u|
            Jn316Gen::DiracHelper.agregar_usuario_a_grupo(
              ldap, gw, u.nusuario, prob
            )
          end
          @grupo.subgrupo.each do |s|
            sw = 'Grupo' + s.cn
            Jn316Gen::DiracHelper.agregar_subgrupo_a_grupo(
              ldap, gw, sw, prob
            )
          end

        end
        if prob != ''
          mflash = {error: "No se completaron todas las operaciones: #{prob}"}
        else
          mflash = {notice: "Grupo creado en directorio activo"}
        end
        redirect_back fallback_location: sip.admin_grupo_path(@grupo),
          flash: mflash
      end

      def arbol
        render layout: 'application'
      end

    end
  end
end
