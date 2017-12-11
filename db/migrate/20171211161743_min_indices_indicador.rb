class MinIndicesIndicador < ActiveRecord::Migration[5.1]
  def change
    execute <<-SQL
      SELECT pg_catalog.setval('coordinador_proyectofinanciero_id_seq', 100, false);
      SELECT pg_catalog.setval('cor1440_gen_indicadorpf_id_seq', 100, false);
      SELECT pg_catalog.setval('cor1440_gen_tipoindicador_id_seq', 100, false);
      SELECT pg_catalog.setval('cor1440_gen_resultadopf_id_seq', 100, false);
      SELECT pg_catalog.setval('cor1440_gen_objetivopf_id_seq', 100, false);
      SELECT pg_catalog.setval('cor1440_gen_proyectofinanciero_id_seq', GREATEST(MAX(id), 100), false) FROM cor1440_gen_proyectofinanciero;
    SQL
  end
end
