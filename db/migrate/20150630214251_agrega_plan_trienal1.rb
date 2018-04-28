class AgregaPlanTrienal1 < ActiveRecord::Migration[4.2]
  def change
    add_column :cor1440_gen_actividad, :alcance, :string, limit: 50
    add_column :cor1440_gen_actividad, :accionincidencia, :boolean
    add_column :cor1440_gen_actividad, :accioncgenero, :boolean
    add_column :cor1440_gen_actividad, :accioncetnia, :boolean
  end
end
