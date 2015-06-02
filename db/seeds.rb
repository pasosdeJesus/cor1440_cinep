# encoding: UTF-8

connection = ActiveRecord::Base.connection();

# Básicas de motor sip
l = File.readlines(
  Gem.loaded_specs['sip'].full_gem_path + "/db/datos-basicas.sql"
)
connection.execute(l.join("\n"))

# Cambios a básicas existentes
if File.exists?(Gem.loaded_specs['cor1440_gen'].full_gem_path + 
                "/db/cambios-basicas.sql") then
	l = File.readlines(Gem.loaded_specs['cor1440_gen'].full_gem_path + 
                "/db/cambios-basicas.sql")
	connection.execute(l.join("\n"))
end

# Nuevas basicas de cor1440_gen
if File.exists?(Gem.loaded_specs['cor1440_gen'].full_gem_path + 
                "/db/datos-basicas.sql") then
	l = File.readlines(Gem.loaded_specs['cor1440_gen'].full_gem_path + 
                "/db/datos-basicas.sql")
	connection.execute(l.join("\n"))
end


# Cambios a básicas existentes
if File.exists?("db/cambios-basicas.sql") then
	l = File.readlines("db/cambios-basicas.sql")
	connection.execute(l.join("\n"))
end

# Nuevas basicas de este
if File.exists?("db/datos-basicas.sql") then
	l = File.readlines("db/datos-basicas.sql")
	connection.execute(l.join("\n"));
end


# cor1440, cor1440
connection.execute("INSERT INTO usuario 
	(nusuario, email, encrypted_password, password, 
  fechacreacion, created_at, updated_at, rol) 
	VALUES ('cor1440', 'bd@localhost', 
	'$2a$10$q0KcAa.H6.3VrXeKTJHa/ue8uT0y7WVKKHlAVor.Nejpz1OAgAQOq',
	'', '2014-08-14', '2014-08-14', '2014-08-14', 1);")


