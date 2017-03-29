class NombresApellidosPoromision < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      ALTER TABLE usuario ALTER COLUMN nombres SET DEFAULT 'N';
      ALTER TABLE usuario ALTER COLUMN apellidos SET DEFAULT 'N';
      ALTER TABLE usuario ALTER COLUMN oficina_id SET DEFAULT '1';
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE usuario ALTER COLUMN nombres DROP DEFAULT;
      ALTER TABLE usuario ALTER COLUMN apellidos DROP DEFAULT;
      ALTER TABLE usuario ALTER COLUMN oficina_id DROP DEFAULT;
    SQL
  end

end
