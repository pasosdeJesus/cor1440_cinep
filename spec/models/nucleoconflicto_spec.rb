# encoding: UTF-8
require 'rails_helper'

RSpec.describe Nucleoconflicto, :type => :model do

  it "valido" do
    nucleoconflicto = FactoryGirl.build(:nucleoconflicto)
    expect(nucleoconflicto).to be_valid
    nucleoconflicto.destroy
  end

  it "no valido" do
    nucleoconflicto = 
      FactoryGirl.build(:nucleoconflicto, nombre: '')
    expect(nucleoconflicto).not_to be_valid
    nucleoconflicto.destroy
  end

  it "existente" do
    nucleoconflicto = ::Nucleoconflicto.where(id: 1).take
    expect(nucleoconflicto.nombre).to eq("CULTURAS POLÍTICAS, IDENTIDADES Y DD-HH")
  end

end
