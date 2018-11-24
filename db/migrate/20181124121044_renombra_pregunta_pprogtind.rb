class RenombraPreguntaPprogtind < ActiveRecord::Migration[5.2]
  def up
    rename_column :cor1440_gen_pprogtind, :pregunta, :fase
    execute <<-SQL
      SELECT setval('cor1440_gen_pprogtind_id_seq', 1001);
    SQL
  end
  def down
    rename_column :cor1440_gen_pprogtind, :fase, :pregunta
  end
end
