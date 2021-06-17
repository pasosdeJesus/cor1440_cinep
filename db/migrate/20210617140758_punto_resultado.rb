class PuntoResultado < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_resultadopf 
        SET numero=numero || '.'
        WHERE id>=45 AND id<=50;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE cor1440_gen_resultadopf 
        SET numero=LEFT(numero, LENGTH(numero)-1)
        WHERE id>=45 AND id<=50;
    SQL

  end
end
