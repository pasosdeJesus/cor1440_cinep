# encoding: UTF-8

module Cor1440Gen
  module GruposHelper
 
    # De una base de compromisos, filtra los de unos grupos
    # @param pf Base de compromisos
    # @param grupos grupos para filtrar
    def self.compromisos_grupos(pf, grupos)
      if grupos.count == 0
        pf = pf.where('TRUE=FALSE')
      else
        pf = pf.where(
          "id IN (SELECT proyectofinanciero_id " +
          "FROM grupo_proyectofinanciero " +
          "WHERE grupo_id IN (#{grupos.map(&:id).join(', ')}))")
      end
      pf = pf.order(:referenciacinep)
      return pf
    end


    # Retorna grupos y supergrupos a los que un usuario pertenece
    # excluyendo el grupo 'Usuarios'
    def self.mis_grupos_sinus(usuario)
      return nil if usuario.nil?
      if usuario.rol == Ability::ROLADMIN || 
           usuario.rol == Ability::ROLDIR
        misgrupossinu = Sip::Grupo.habilitados.where(
          "nombre<>'Usuarios'")
      else
        cg = ::ApplicationHelper.supergrupos_usuario(
          usuario) - ['Usuarios']
        misgrupossinu = Sip::Grupo.habilitados.where(
          "nombre IN ('#{cg.join("', '")}')")
      end
      return misgrupossinu
    end

    def self.usuarios_gerenciaproyectos
      wu = "id IN (SELECT usuario_id FROM sip_grupo_usuario 
         JOIN sip_grupo ON sip_grupo.id=sip_grupo_usuario.sip_grupo_id
         WHERE sip_grupo.cn LIKE '%GerenciaDeProyectos')"

      umgu = ::Usuario.where(wu).order(:nombres, :apellidos, :nusuario) 

      return umgu
    end

  end
end

