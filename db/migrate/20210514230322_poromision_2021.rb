class Poromision2021 < ActiveRecord::Migration[6.1]

  def up
    [21, 22, 19].each do |pid|
      p = Cor1440Gen::Proyectofinanciero.find(pid)
      p.poromision=true
      p.save!
    end
  end

  def down
    [21, 22, 19].each do |pid|
      p = Cor1440Gen::Proyectofinanciero.find(pid)
      p.poromision=nil
      p.save!
    end
  end

end
