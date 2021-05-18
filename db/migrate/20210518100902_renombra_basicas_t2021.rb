class RenombraBasicasT2021 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE nivelrelacion SET
        nombre='ACTOR ALIADO DE MISIÓN'
        WHERE
        nombre='ACTOR DE MISIÓN'
      ;
    SQL
  end
  def down
    execute <<-SQL
      UPDATE nivelrelacion SET
        nombre='ACTOR DE MISIÓN'
        WHERE
        nombre='ACTOR ALIADO DE MISIÓN'
      ;
    SQL

  end
end
