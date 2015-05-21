# encoding: UTF-8
require 'rails_helper'

RSpec.describe Actor, :type => :model do

  it "valido" do
    actor = FactoryGirl.build(:actor)
    expect(actor).to be_valid
    actor.destroy
  end

  it "no valido" do
    actor = 
      FactoryGirl.build(:actor, nombre: '')
    expect(actor).not_to be_valid
    actor.destroy
  end

  it "existente" do
    actor = ::Actor.where(id: 1).take
    expect(actor.nombre).to eq("CINEP")
  end

end
