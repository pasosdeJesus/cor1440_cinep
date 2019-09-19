# encoding: utf-8

require 'jn316_gen/ldap_helper'

def run
  if !ENV['JN316_CLAVE']
    puts "Falta clave LDAP"
    exit 1
  end
  prob = ''
  Jn316Gen::LdapHelper.ldap_busca_como_admin('vtamara', prob)
  puts "1 prob=#{prob}"
  g = Sip::Grupo.where(nombre: 'Usuarios').take
  #byebug
  u = ::Usuario.new(nombres: 'uvw', apellidos: 'uvw', 
                    nusuario: 'uvw', email: 'uvw@uvw.uvw')
  u.sip_grupo_ids = [g.id]

  Jn316Gen::LdapHelper.ldap_crea_usuario(u, 'uvw', 'uvw', prob)
  puts "2 prob=#{prob}"
end

run
