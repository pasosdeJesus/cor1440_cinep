# encoding: UTF-8

FactoryGirl.define do
  factory :publicacion, class: 'Publicacion' do
    id 1000 # Buscamos que no interfiera con existentes
    nombre "Publicacion"
    fechacreacion "2015-06-30"
    created_at "2015-06-30"
  end
end
