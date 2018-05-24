class AumentaNitfinanciador < ActiveRecord::Migration[5.2]
  def up
    change_column :cor1440_gen_proyectofinanciero, :nitfinanciador, :string,
      limit: 127
  end
  def down
    change_column :cor1440_gen_proyectofinanciero, :nitfinanciador, :string,
      limit: 31
  end
end
