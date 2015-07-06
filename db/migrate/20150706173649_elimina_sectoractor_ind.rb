class EliminaSectoractorInd < ActiveRecord::Migration
  def change
    remove_column :actor, :sectoractor_id
  end
end
