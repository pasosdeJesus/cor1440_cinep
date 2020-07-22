class AgregaAcpMesIniInexacto < ActiveRecord::Migration[6.0]
  def up
    add_column :acp, :mesini_inexacto, :boolean, default: false
    c = Heb412Gen::Campoplantillahcm.create(
      id: 38, plantillahcm_id: 30, nombrecampo: 'descripcion', columna: 'I')
    c.save!
    id=36
    while id>=33 
      cf = Heb412Gen::Campoplantillahcm.find(id)
      cd = Heb412Gen::Campoplantillahcm.find(id+1)
      cd.nombrecampo = cf.nombrecampo
      cd.columna = cf.columna.next
      cd.save!
      id -= 1
    end
    c = Heb412Gen::Campoplantillahcm.find(33)
    c.nombrecampo = 'mesini_inexacto'
    c.columna = 'D'
    c.save!
  end

  def down
    id = 33
    while id<=37 
      cf = Heb412Gen::Campoplantillahcm.find(id+1)
      cd = Heb412Gen::Campoplantillahcm.find(id)
      cd.nombrecampo = cf.nombrecampo
      cd.columna = (cf.columna.ord - 1).chr
      cd.save!
      id += 1
    end
    c = Heb412Gen::Campoplantillahcm.find(38)
    c.destroy

    remove_column :acp, :mesini_inexacto
  end
end
