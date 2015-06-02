# encoding: UTF-8
require 'rails_helper'

RSpec.describe Sectoractor, :type => :model do

  it "valido" do
    sectoractor = FactoryGirl.build(:sectoractor)
    expect(sectoractor).to be_valid
    sectoractor.destroy
  end

  it "no valido" do
    sectoractor = FactoryGirl.build(:sectoractor, nombre: '')
    expect(sectoractor).not_to be_valid
    sectoractor.destroy
  end

  it "existente" do
    sectoractor = Sectoractor.where(id: 1).take
    expect(sectoractor.nombre).to eq("SIN INFORMACIÓN")
  end

end
