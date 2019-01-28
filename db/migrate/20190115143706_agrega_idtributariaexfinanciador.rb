class AgregaIdtributariaexfinanciador < ActiveRecord::Migration[5.2]
  def change
    add_column :cor1440_gen_proyectofinanciero, :idtributariaextfinanciador, 
      :string, limit: 511
  end
end
