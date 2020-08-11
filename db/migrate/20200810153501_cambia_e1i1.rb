class CambiaE1i1 < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_indicadorpf SET tipoindicador_id=1 where id=18;
    SQL
  end

  def down
    execute <<-SQL
      UPDATE cor1440_gen_indicadorpf SET tipoindicador_id=18 where id=1;
    SQL
  end
end
