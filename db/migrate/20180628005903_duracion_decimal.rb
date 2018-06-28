# encoding: UTF-8
class DuracionDecimal < ActiveRecord::Migration[5.2]
  def up
    change_column :cor1440_gen_actividad, :duracion, :decimal
  end
  def down
    change_column :cor1440_gen_actividad, :duracion, :integer
  end
end
