class EliminaSectoractorInd < ActiveRecord::Migration[4.2]
  def change
    remove_column :actor, :sectoractor_id
  end
end
