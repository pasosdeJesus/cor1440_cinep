# encoding: UTF-8

class AnexoProyectofinanciero < ActiveRecord::Base
  belongs_to :proyectofinanciero, class_name: 'Cor1440Gen::Proyectofinanciero',
    foreign_key: 'proyectofinanciero_id'
  belongs_to :tipoanexo, class_name: '::Tipoanexo',
    foreign_key: 'tipoanexo_id'
  belongs_to :sip_anexo, class_name: 'Sip::Anexo', 
    foreign_key: 'anexo_id', validate: true

  accepts_nested_attributes_for :sip_anexo, reject_if: :all_blank 
  
  validates :proyectofinanciero, presence: true
  validates :sip_anexo, presence: true
  validates :tipoanexo, presence: true
end

