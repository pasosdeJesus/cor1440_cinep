class AjustaMindicadorpfProgresivos < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_mindicadorpf
        SET descd1='Número de políticas públicas locales formulados con enfoque territorial, de género y de derechos (sin tener en cuenta porcentaje de progreso)'
      WHERE id='14';
      UPDATE cor1440_gen_mindicadorpf
        SET descd1='Organizaciones de mujeres que han consolidado y fortalecido iniciativas (solo de la línea base y sin tener en cuenta porcentaje de progreso)',
        descd2='Regiones (sin tener en cuenta porcentaje de progreso)'
        WHERE id='11';
    SQL
  end
  def down
    execute <<-SQL
      UPDATE cor1440_gen_mindicadorpf
        SET descd1='Número de políticas públicas locales formulados con enfoque territorial, de género y de derechos' WHERE id='14';
      UPDATE cor1440_gen_mindicadorpf
        SET descd1='Organizaciones de mujeres que han consolidado y fortalecido iniciativas',
        descd2='Regiones'
        WHERE id='11';
    SQL
  end
end
