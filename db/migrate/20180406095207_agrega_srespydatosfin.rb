class AgregaSrespydatosfin < ActiveRecord::Migration[5.1]
  def change
    add_column :cor1440_gen_proyectofinanciero, :respgp2_id, :integer
    add_foreign_key :cor1440_gen_proyectofinanciero, :usuario, column: :respgp2_id
    add_column :cor1440_gen_proyectofinanciero, :razonsocialfinanciador, :string, limit: 511
    add_column :cor1440_gen_proyectofinanciero, :nitfinanciador, :string, limit: 31
    add_column :cor1440_gen_proyectofinanciero, :replegalfinanciador, :string, limit: 511
    add_column :cor1440_gen_proyectofinanciero, :domiciliofinanciador, :string, limit: 511
    add_column :cor1440_gen_proyectofinanciero, :webfinanciador, :string, limit: 511
    add_column :cor1440_gen_proyectofinanciero, :skypefinanciador, :string, limit: 127
  end
end
