# encoding: UTF-8

module Cor1440Gen
  module GruposHelper
 
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

  end
end

