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

# Nuevas basicas de este motor 
if File.exists?(Gem.loaded_specs['cor1440_gen'].full_gem_path + 
                "/db/datos-basicas.sql") then
	l = File.readlines(Gem.loaded_specs['cor1440_gen'].full_gem_path + 
                "/db/datos-basicas.sql")
	connection.execute(l.join("\n"))
end

# cor1440, cor1440
connection.execute("INSERT INTO usuario 
	(nusuario, email, encrypted_password, password, 
  fechacreacion, created_at, updated_at, rol) 
	VALUES ('bdcinep', 'bd@localhost', 
	'$2a$10$jMRQtFukTd/i00nt7RBcCe5rQ.2.0nFeVNjtXvJOPQBmF6la8ft4m',
	'', '2014-08-14', '2014-08-14', '2014-08-14', 1);")


