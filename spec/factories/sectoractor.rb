# encoding: UTF-8

FactoryGirl.define do
  factory :sectoractor, class: 'Sectoractor' do
    id 1000 # Buscamos que no interfiera con existentes
    nombre "Sectoractor"
    fechacreacion "2015-05-21"
    created_at "2015-05-21"
  end
end
