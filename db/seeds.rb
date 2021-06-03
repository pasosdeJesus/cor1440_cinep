# encoding: UTF-8

conexion = ActiveRecord::Base.connection();

# De motores y finalmente de este
motor = ['sip', 'cor1440_gen', nil]
motor.each do |m|
  puts "db/seeds cambios m=#{m.to_s}"
  Sip::carga_semillas_sql(conexion, m, :cambios)
  puts "db/seeds datos m=#{m.to_s}"
  Sip::carga_semillas_sql(conexion, m, :datos)
end

# Ya no se hace:
# conexion.execute('SET search_path TO "$user", public')
# pues no es seguro, mejor usamos public y pg_catalog explicitamente

# suario y clave cor1440, cor1440
conexion.execute("INSERT INTO public.usuario 
	(nusuario, email, encrypted_password, password, 
  fechacreacion, created_at, updated_at, rol) 
	VALUES ('cor1440', 'bd@localhost', 
	'$2a$10$q0KcAa.H6.3VrXeKTJHa/ue8uT0y7WVKKHlAVor.Nejpz1OAgAQOq',
	'', '2014-08-14', '2014-08-14', '2014-08-14', 1);")


