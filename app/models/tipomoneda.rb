# encoding: UTF-8

class Tipomoneda < ActiveRecord::Base
	include Sip::Basica
  has_many :proyectofinanciero, dependent: :delete_all,
    class_name: 'Cor1440Gen::Proyectofinanciero', 
    foreign_key: 'tipomoneda_id'

 belongs_to :pais, class_name: 'Sip::Pais', foreign_key: 'pais_id'

 validates :codiso4217, length: { maximum: 3}, presence: true
 validates :simbolo, length: { maximum: 10}, presence: true

 def codiso4217=(val)
   self[:codiso4217] = val.upcase.squish if val
 end

end
