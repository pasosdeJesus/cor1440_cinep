class RenombraVistaPlantillahcm < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      UPDATE heb412_gen_plantillahcm SET vista='Cronograma de Solicitud de Informes' WHERE vista='Solicitud de Informe';
    SQL
  end
  def down
    execute <<-SQL
      UPDATE heb412_gen_plantillahcm SET vista='Solicitud de Informe' WHERE vista='Cronograma de Solicitud de Informes';
    SQL
  end
end
