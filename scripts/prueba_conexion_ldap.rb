# encoding: utf-8

require 'jn316_gen/ldap_helper'

def run
  if !ENV['JN316_CLAVE']
    puts "Falta clave LDAP"
    exit 1
  end
  if !ENV['PRC_USUARIO']  # e.g vtamara
    puts "Falta usuario que se buscará"
    exit 1
  end


  prob = ''
  puts "PRUEBA 1. Consultar usuario"
  Jn316Gen::LdapHelper.ldap_busca_como_admin(ENV['PRC_USUARIO'], prob)
  if prob == ''
    puts"  Sin problema"
  else
    puts "  Problema: #{prob}"
  end
  puts "PRUEBA 2. Crear usuario de prueba uvw (si ya existe borrelo)"
  g = Sip::Grupo.where(nombre: 'Usuarios').take
  #byebug
  u = ::Usuario.new(nombres: 'uvw', apellidos: 'uvw', 
                    nusuario: 'uvw', email: 'uvw@uvw.uvw')
  u.sip_grupo_ids = [g.id]

  Jn316Gen::LdapHelper.ldap_crea_usuario(u, 'uvw', 'uvw', prob)
  if prob == ''
    puts"  Sin problema"
  else
    puts "  Problema: #{prob}"
  end
end

run
