class FormularioMunicipioI6 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      INSERT INTO public.mr519_gen_formulario (id, nombre, nombreinterno) 
        VALUES (30, 'Municipio', 'fmunicipio');
      INSERT INTO public.mr519_gen_campo (id, nombre, ayudauso, tipo, 
        obligatorio, formulario_id, nombreinterno, fila, columna, ancho, 
        tablabasica) VALUES (150, 'Municipio', '', 15, true, 30, 
        'municipio', NULL, NULL, NULL, 'municipios');
      INSERT INTO public.cor1440_gen_formulario_mindicadorpf 
        (formulario_id, mindicadorpf_id) VALUES (30, 26);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.cor1440_gen_formulario_mindicadorpf 
        WHERE formulario_id = 30 AND mindicadorpf_id=26;
      DELETE FROM public.mr519_gen_campo 
        WHERE id = 150;
      DELETE FROM public.mr519_gen_formulario 
        WHERE id = 30;
    SQL
  end
end
