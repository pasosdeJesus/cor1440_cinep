# encoding: UTF-8
require 'rails_helper'

RSpec.describe Publicacion, :type => :model do

  it "valido" do
    publicacion = FactoryGirl.build(:publicacion)
    expect(publicacion).to be_valid
    publicacion.destroy
  end

  it "no valido" do
    publicacion = 
      FactoryGirl.build(:publicacion, nombre: '')
    expect(publicacion).not_to be_valid
    publicacion.destroy
  end

  it "existente" do
    publicacion = ::Publicacion.where(id: 1).take
    expect(publicacion.nombre).to eq("NOCHE Y NIEBLA 50")
  end

end
