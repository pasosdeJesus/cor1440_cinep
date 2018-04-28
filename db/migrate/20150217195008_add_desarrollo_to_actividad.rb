class AddDesarrolloToActividad < ActiveRecord::Migration[4.2]
  def change
    add_column :sivel2_gen_actividad, :desarrollo, :string, limit: 5000
    add_column :sivel2_gen_actividad, :papel, :string, limit: 5000
    add_column :sivel2_gen_actividad, :participantes, :string, limit: 5000
    add_column :sivel2_gen_actividad, :totorg, :integer
    add_column :sivel2_gen_actividad, :blancos, :integer
    add_column :sivel2_gen_actividad, :mestizos, :integer
    add_column :sivel2_gen_actividad, :indigenas, :integer
    add_column :sivel2_gen_actividad, :negros, :integer
    add_column :sivel2_gen_actividad, :hombres, :integer
    add_column :sivel2_gen_actividad, :mujeres, :integer
    add_column :sivel2_gen_actividad, :tipo, :string, limit: 500
    add_column :sivel2_gen_actividad, :convocante, :string, limit: 500
    add_column :sivel2_gen_actividad, :lugar, :string, limit: 500
    add_column :sivel2_gen_actividad, :valora, :integer
  end
end
