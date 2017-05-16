class CreateJoinTableRegiongrupoDepartamento < ActiveRecord::Migration[5.0]
  def change
    create_join_table :regiongrupo, :sip_departamento do |t|
      # t.index [:sip_departamento_id, :regiongrupo_id]
      # t.index [:regiongrupo_id, :sip_departamento_id]
    end
  end
end
