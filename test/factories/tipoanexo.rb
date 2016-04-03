# encoding: UTF-8

FactoryGirl.define do
  factory :tipoanexo, class: 'Tipoanexo' do
    id 1000 # Buscamos que no interfiera con existentes
    nombre "Tipoanexo"
    fechacreacion "2016-03-08"
    created_at "2016-03-08"
  end
end
