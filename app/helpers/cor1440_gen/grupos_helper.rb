# encoding: UTF-8

module Cor1440Gen
  module GruposHelper
 
    def self.mis_grupos_sinus(current_usuario)
      if current_usuario.rol == Ability::ROLADMIN || 
           current_usuario.rol == Ability::ROLDIR
        misgrupossinu = Sip::Grupo.habilitados.where("nombre<>'Usuarios'")
      else
        cg = ::ApplicationHelper.supergrupos_usuario(current_usuario) - ['Usuarios']
        misgrupossinu = Sip::Grupo.habilitados.where("nombre IN ('#{cg.join("', '")}')")
      end
      return misgrupossinu
    end

  end
end

