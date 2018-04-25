class AsociaTipocontratoTiponomina < ActiveRecord::Migration[5.2]
  def up
    add_column :tipocontrato, :tiponomina_id, :integer, null: false, default: 1
    add_foreign_key :tipocontrato, :tiponomina, column: :tiponomina_id

    execute <<-SQL
      UPDATE tipocontrato SET tiponomina_id='1' WHERE id='1';
      UPDATE tipocontrato SET tiponomina_id='2' WHERE id IN ('2', '8');
      UPDATE tipocontrato SET tiponomina_id='3' WHERE id IN ('3');
      UPDATE tipocontrato SET tiponomina_id='4' WHERE id IN ('4', '5', '6');
      UPDATE tipocontrato SET tiponomina_id='5' WHERE id IN ('7', '9');
    SQL
  end

  def down
    remove_foreign_key :tipocontrato, :tiponomina
    remove_column :tipocontrato, :tiponomina_id
  end
end
