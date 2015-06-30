# encoding: UTF-8
require 'rails_helper'

RSpec.describe Redactor, :type => :model do

  it "valido" do
    redactor = FactoryGirl.build(:redactor)
    expect(redactor).to be_valid
    redactor.destroy
  end

  it "no valido" do
    redactor = 
      FactoryGirl.build(:redactor, nombre: '')
    expect(redactor).not_to be_valid
    redactor.destroy
  end

  it "existente" do
    redactor = ::Redactor.where(id: 1).take
    expect(redactor.nombre).to eq("RED PRODEPAZ")
  end

end
