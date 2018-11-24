class PorcprogEn0Poromision < ActiveRecord::Migration[5.2]
  def up
    change_column :efecto, :porcentajeprog, :integer, default: 0
  end
end
