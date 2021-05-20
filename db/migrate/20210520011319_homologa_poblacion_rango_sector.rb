class HomologaPoblacionRangoSector < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_actividad 
        SET rangoedad_onr=COALESCE(hombres,0)+COALESCE(mujeres,0)+COALESCE(sexo_onr,0)-COALESCE(jovenes,0),
        sectorsocial_onr=COALESCE(hombres,0)+COALESCE(mujeres,0)+COALESCE(sexo_onr,0)-COALESCE(campesinos,0)
        WHERE rangoedad_onr IS NULL AND
        sectorsocial_onr IS NULL;
    SQL
  end
  def down
    execute <<-SQL
    SQL
  end
end
