class Quitanc < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      DELETE FROM escalaindmuy WHERE id=6;
      SELECT setval('escalaindmuy_id_seq', 100);
    SQL
  end
end
