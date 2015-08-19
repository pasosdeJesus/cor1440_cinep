class ConvocanteMayuscula < ActiveRecord::Migration
  def up
    execute <<-SQL
      UPDATE cor1440_gen_actividad SET convocante=UPPER(convocante);
    SQL
  end
  def down
  end
end
