# encoding: utf-8

require 'net/ldap'
require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class LdapAuthenticatable < Authenticatable
      def authenticate!
        byebug
        #username = 'cn=admin,dc=cinep,dc=org,dc=co'
        #password = 'lypnoazt'
        if params[:usuario]
          nusuario = limpia_usuario(params[:usuario][:nusuario])
          username="cn=#{nusuario},ou=gente,dc=cinep,dc=org,dc=co"
          password = params[:usuario][:password]
          ldap_con = Net::LDAP.new({
            host: '192.168.10.21',
            port: 389,
            auth: {
              method: :simple, 
              username: username, 
              password: password 
            },
            encryption: {
              method: :start_tls,
              tls_options: OpenSSL::SSL::SSLContext::DEFAULT_PARAMS
            }
          })

          if ldap_con.bind
            usuario = Usuario.find_or_create_by(nusuario: nusuario)
            if (!usuario.email) then
              usuario.email = 'x' # aqui completar registro de usuario con información de LDAP considerar tambien el tema de sincronizar
            end
            success!(usuario)
          else
            fail(:invalid_login)
          end
        end
      end

      # Un usuario solo puede tener letras, digitos y _
      def limpia_usuario(u)
        r = ""
        u.split("").each do |c|
          r += case c
          when 'a'..'z' then c
          when 'A'..'Z' then c
          when '0'..'9' then c
          when '_' then '_'
          else ''
          end
        end
        return r
      end
            
    end
  end
end

Warden::Strategies.add(:ldap_authenticatable, Devise::Strategies::LdapAuthenticatable)
