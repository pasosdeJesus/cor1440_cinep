class AgregaFechainvEncuestaper < ActiveRecord::Migration[6.0]
  def change
    add_column :mr519_gen_encuestapersona, :fechainv, :date
  end
end
