class ConvierteProductos < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
    INSERT INTO productopf(proyectofinanciero_id, tipoproductopf_id, detalle,
      created_at, updated_at)
    (SELECT id, 1, compromisos, created_at, updated_at FROM cor1440_gen_proyectofinanciero);
    SQL
    remove_column :cor1440_gen_proyectofinanciero, :compromisos
  end
  def down
    add_column :cor1440_gen_proyectofinanciero, :compromisos, 
      :string, limit: 5000
    execute <<-SQL
    UPDATE cor1440_gen_proyectofinanciero SET
      compromisos=detalle 
      FROM productopf WHERE 
      cor1440_gen_proyectofinanciero.id = productopf.proyectofinanciero_id
    SQL
  end
end
