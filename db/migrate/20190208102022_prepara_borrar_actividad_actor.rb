class PreparaBorrarActividadActor < ActiveRecord::Migration[5.2]
  def change
    rename_table :actividad_actor, :actividad_actor_porborrar
  end
end
