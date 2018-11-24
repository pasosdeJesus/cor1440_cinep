class EfectoFase0 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE efecto SET porcentajeprog=0 
        WHERE porcentajeprog IS NULL AND indicadorpf_id IN ('19', '22');
    SQL
  end
  def down
    execute <<-SQL
      UPDATE efecto SET porcentajeprog=NULL
        WHERE porcentajeprog=0 AND indicadorpf_id IN ('19', '22');
    SQL
  end
end
