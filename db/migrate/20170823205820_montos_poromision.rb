class MontosPoromision < ActiveRecord::Migration[5.1]
  def up
    change_column_default(:cor1440_gen_proyectofinanciero, :monto, 0.0)
    change_column_default(:cor1440_gen_proyectofinanciero, :montopesos, 0.0)
    change_column_default(:cor1440_gen_proyectofinanciero, :presupuestototal, 0.0)
  end
  def down
    change_column_default(:cor1440_gen_proyectofinanciero, :monto, :nil)
    change_column_default(:cor1440_gen_proyectofinanciero, :montopesos, :nil)
    change_column_default(:cor1440_gen_proyectofinanciero, :presupuestototal, :nil)
  end

end
