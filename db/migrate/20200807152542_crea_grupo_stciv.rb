class CreaGrupoStciv < ActiveRecord::Migration[6.0]
  def up
    if Sip::Grupo.where(nombre: 'STCIV').count == 0
      Sip::Grupo.create(nombre: 'STCIV', fechacreacion: '2020-08-07')
    end
  end
  def down
  end
end
