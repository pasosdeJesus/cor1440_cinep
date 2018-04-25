class IndicadoresTrienalAEfecto < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
        UPDATE cor1440_gen_indicadorpf SET objetivopf_id=resultadopf_id, resultadopf_id=NULL WHERE proyectofinanciero_id=18;
    SQL
  end
  def down
    execute <<-SQL
        UPDATE cor1440_gen_indicadorpf SET resultadopf_id=objetivopf_id, objetivopf_id=NULL WHERE proyectofinanciero_id=18;
    SQL
  end
end
