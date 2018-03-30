class HomologaRecursoeconomicosTc2 < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
    UPDATE cor1440_gen_proyectofinanciero 
      SET presupuestototalej=montoej+aportecinepej+aporteotrosej+saldoej;
    SQL
  end
end
