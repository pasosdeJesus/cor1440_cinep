class CambiaTituloPlaninst < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_proyectofinanciero SET 
      nombre='PLAN ESTRATÉGICO TRIENAL 2018-2020', 
      referencia='PLAN ESTRATÉGICO TRIENAL 2018-2020', 
      referenciacinep='PLAN ESTRATÉGICO TRIENAL 2018-2020', 
      fechacierre='2020-12-31' WHERE id='18';
    SQL
  end
  def down
    execute <<-SQL
      UPDATE cor1440_gen_proyectofinanciero SET 
      nombre='PLAN QUINQUENAL 2018-2022', 
      referencia='PLAN QUINQUENAL 2018-2022', 
      referenciacinep='PLAN QUINQUENAL 2018-2020', 
      fechacierre='2022-12-31' WHERE id='18';
    SQL
  end
end
