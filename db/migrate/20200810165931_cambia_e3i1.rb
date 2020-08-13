class CambiaE3i1 < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_indicadorpf SET  tipoindicador_id=10 WHERE id=21;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE cor1440_gen_indicadorpf SET  tipoindicador_id=21 WHERE id=21;
    SQL
  end
end
