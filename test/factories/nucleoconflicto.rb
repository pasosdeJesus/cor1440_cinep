# encoding: UTF-8

FactoryGirl.define do
  factory :nucleoconflicto, class: 'Nucleoconflicto' do
    id 1000 # Buscamos que no interfiera con existentes
    nombre "Nucleoconflicto"
    fechacreacion "2015-06-30"
    created_at "2015-06-30"
  end
end
