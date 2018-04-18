# encoding: UTF-8

class AnexoUsuario < ActiveRecord::Base
  belongs_to :usuario, class_name: '::Usuario',
    foreign_key: 'usuario_id'
  belongs_to :sip_anexo, class_name: 'Sip::Anexo', 
    foreign_key: 'anexo_id', validate: true

  accepts_nested_attributes_for :sip_anexo, reject_if: :all_blank 
  
  validates :usuario, presence: true
  validates :sip_anexo, presence: true
end

