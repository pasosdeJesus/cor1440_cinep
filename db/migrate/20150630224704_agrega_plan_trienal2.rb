class AgregaPlanTrienal2 < ActiveRecord::Migratio[4.2]
  def change
    add_column :cor1440_gen_actividad, :nucleoconflicto_id, :integer
    add_column :cor1440_gen_actividad, :redactor_id, :integer
    add_foreign_key :cor1440_gen_actividad, :nucleoconflicto, 
      column: 'nucleoconflicto_id'
    add_foreign_key :cor1440_gen_actividad, :redactor, 
      column: 'redactor_id'
  end
end
