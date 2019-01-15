# encoding: UTF-8

class AnexoConvenio < ActiveRecord::Base
  belongs_to :convenio, class_name: '::Convenio',
    foreign_key: 'convenio_id'
  belongs_to :sip_anexo, class_name: 'Sip::Anexo', 
    foreign_key: 'anexo_id', validate: true

  accepts_nested_attributes_for :sip_anexo, reject_if: :all_blank 
  
  validates :convenio, presence: true
  validates :sip_anexo, presence: true
end

