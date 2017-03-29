class NombresApellidosPoromision < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      ALTER TABLE usuario ALTER COLUMN nombres SET DEFAULT 'N';
      UPDATE usuario SET nombres='N' WHERE nombres IS NULL;
      ALTER TABLE usuario ALTER COLUMN nombres SET NOT NULL;
      ALTER TABLE usuario ALTER COLUMN apellidos SET DEFAULT 'N';
      UPDATE usuario SET apellidos='N' WHERE nombres IS NULL;
      ALTER TABLE usuario ALTER COLUMN apellidos SET NOT NULL;
      ALTER TABLE usuario ALTER COLUMN oficina_id SET DEFAULT '1';
      UPDATE usuario SET oficina_id='1' WHERE oficina_id IS NULL;
      ALTER TABLE usuario ALTER COLUMN oficina_id SET NOT NULL;
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE usuario ALTER COLUMN nombres DROP NOT NULL;
      ALTER TABLE usuario ALTER COLUMN nombres DROP DEFAULT;
      ALTER TABLE usuario ALTER COLUMN apellidos DROP DEFAULT;
      ALTER TABLE usuario ALTER COLUMN apellidos DROP NOT NULL;
      ALTER TABLE usuario ALTER COLUMN oficina_id DROP DEFAULT;
      ALTER TABLE usuario ALTER COLUMN oficina_id DROP NOT NULL;
    SQL
  end

end
