# encoding: UTF-8

module Cor1440Gen
  module GruposHelper
 
    def self.mis_grupos_sinus(current_usuario)
      if current_usuario.rol == Ability::ROLADMIN || 
           current_usuario.rol == Ability::ROLDIR
        misgrupossinu = Sip::Grupo.habilitados.where("nombre<>'usuario'")
      else
        misgrupossinu = 
          ApplicationHelper.supergrupos_usuario(current_usuario) - ['usuario']
      end
    end

  end
end

