class PlantillahcmAcpmin < ActiveRecord::Migration[6.0]
  def up
    p = Heb412Gen::Plantillahcm.create(
      id: 30, 
      ruta: 'Acciones colectivas por la paz/plantillas/acp_min_norm.ods',
      fuente: 'CINEP/PPP',
      licencia: '',
      vista: 'Acp',
      nombremenu: 'Listado mínimo de acciones colectivas por la paz',
      filainicial: 2
    )
    p.save!
    idc = 30
    [['id', 'A'],
     ['cataccion', 'B'],
     ['fini', 'C'],
     ['ffin', 'D'],
     ['confr', 'E'],
     ['cobertura', 'F'],
     ['motivo', 'G'],
     ['descripcion', 'H']
    ].each do |c|
      cp = Heb412Gen::Campoplantillahcm.create(
        id: idc,
        plantillahcm_id: 30,
        nombrecampo: c[0], 
        columna: c[1]
      )
      cp.save!
      idc += 1
    end
  end

  def down
    execute <<-SQL
      DELETE FROM heb412_gen_campoplantillahcm WHERE id>='30' and id<'40';
      DELETE FROM heb412_gen_plantillahcm WHERE id='30';
    SQL
  end
end
