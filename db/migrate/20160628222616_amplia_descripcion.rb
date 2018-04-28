class AmpliaDescripcion < ActiveRecord::Migration[4.2]
  def up
    execute  <<-SQL
    ALTER TABLE desembolso ALTER COLUMN detalle TYPE VARCHAR(5000);
    ALTER TABLE informenarrativo ALTER COLUMN detalle TYPE VARCHAR(5000);
    ALTER TABLE informefinanciero ALTER COLUMN detalle TYPE VARCHAR(5000);
    ALTER TABLE informeauditoria ALTER COLUMN detalle TYPE VARCHAR(5000);
    SQL
  end
  def down
    execute  <<-SQL
    ALTER TABLE desembolso ALTER COLUMN detalle TYPE VARCHAR(500);
    ALTER TABLE informenarrativo ALTER COLUMN detalle TYPE VARCHAR(500);
    ALTER TABLE informefinanciero ALTER COLUMN detalle TYPE VARCHAR(500);
    ALTER TABLE informeauditoria ALTER COLUMN detalle TYPE VARCHAR(500);
    SQL
  end
end
