class LlenaInicialMarcalb20182020 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE actor SET lineabase20182020='t' 
        WHERE fechacreacion<='2018-07-31'
        AND fechadeshabilitacion IS NULL;
    SQL
  end
end
