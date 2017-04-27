class CambiaRolPordefecto < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      ALTER TABLE usuario ALTER COLUMN rol SET DEFAULT 5
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE usuario ALTER COLUMN rol SET DEFAULT 4
    SQL
  end
end
