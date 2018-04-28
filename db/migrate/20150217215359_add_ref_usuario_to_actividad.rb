class AddRefUsuarioToActividad < ActiveRecord::Migration[4.2]
  def change
    add_reference :sivel2_gen_actividad, :usuario, index: true
  end
end
