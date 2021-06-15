FactoryGirl.define do
  factory :tipomoneda, class: 'Tipomoneda' do
    id 1000 # Buscamos que no interfiera con existentes
    nombre "Tipomoneda"
    fechacreacion "2016-02-18"
    created_at "2016-02-18"
  end
end
