class CreatePlanencuesta < ActiveRecord::Migration[6.0]
  def change
    create_table :planencuesta do |t|
      t.date :fechaini
      t.date :fechafin
      t.integer :formulario_id
      t.integer :plantillacorreoinv_id
      t.timestamp :created_at
      t.timestamp :updated_at
    end

    add_foreign_key :planencuesta, :plantillacorreo, 
      column: :plantillacorreoinv_id
    add_foreign_key :planencuesta, :mr519_gen_formulario,
      column: :formulario_id
  end
end
