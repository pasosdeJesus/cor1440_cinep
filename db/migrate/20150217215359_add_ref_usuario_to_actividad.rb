class AddRefUsuarioToActividad < ActiveRecord::Migration
  def change
    add_reference :sivel2_gen_actividad, :usuario, index: true
  end
end
