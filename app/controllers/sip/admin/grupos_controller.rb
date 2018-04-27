# encoding: UTF-8

require 'jn316_gen/concerns/controllers/grupos_controller'

module Sip
  module Admin
    class GruposController < Sip::Admin::BasicasController
      include Jn316Gen::Concerns::Controllers::GruposController
      load_and_authorize_resource  class: Sip::Grupo, except: :arbol

      def atributos_index
        [ "id", "nombre", "cn", "gidNumber", "ultimasincldap_localizada" ] +
          [ :subgrupo_ids => [] ] +
          ["procesogh_id", "fechacreacion", "fechadeshabilitacion" ]
      end

      def atributos_show
        [ "id", "nombre", "cn", "gidNumber", "ultimasincldap_localizada" ] +
          [ :usuario_ids => [] ] +
          [ :subgrupo_ids => [] ] +
          ["procesogh_id",
           "observaciones", 
           "fechacreacion", 
           "fechadeshabilitacion" ]
      end

      def atributos_form
        [ "nombre", "cn", "gidNumber", "ultimasincldap_localizada" ] +
          [ :usuario_ids => [] ] +
          [ :subgrupo_ids => [] ] +
          ["procesogh_id",
           "observaciones", 
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
        authorize! :read, Sip::Grupo
        render layout: 'application'
      end
    
      # API
      def coordinadores
        if params && params[:filtro] && params[:filtro][:ids] && 
          params[:filtro][:ids] != ''
          ids = params[:filtro][:ids]
          lc = []
          ids.each do |idg|
            g = Sip::Grupo.find(idg.to_i)
            bc = 'Coordinador' + g.cn.sub('Linea', '')
            gc = Sip::Grupo.where(cn: bc).take
            if gc
              gc.usuario.each do |u|
                lc << u.id
              end
            end
          end
          if lc.length > 0
            respond_to do |format|
              format.json {
                render inline: lc.to_json
              }
            end
          end
        end
      end

      # API
      def procesosgh
        if !params || !params[:ids] || params[:ids] == ''
          render json: 'Sin parametro id', status: :unprocessable_entity
          return false
        end
        ls = []
        params[:ids].each do |idg|
          if idg.to_i > 0
            g = Sip::Grupo.find(idg.to_i)
            if g.procesogh && !ls.include?(g.procesogh.nombre)
              ls << g.procesogh.nombre
            end
          end
        end
        lso = ls.localize(:es).sort.to_a
        render json: {res: lso.join("; ")}, status: :ok
      end

      # API
      def supragrupos
        if !params || !params[:ids] || params[:ids] == ''
          render json: 'Sin parametro id', status: :unprocessable_entity
          return false
        end
        ls = []
        params[:ids].each do |idg|
          if idg.to_i > 0
            g = Sip::Grupo.find(idg.to_i)
            if g
              ls << g.nombre if !ls.include?(g.nombre)
              ApplicationHelper.supergrupos_grupo(g, ls)
            end
          end
        end
        lso = ls.localize(:es).sort.to_a
        render json: {res: lso.join("; ")}, status: :ok
      end

    end
  end
end
