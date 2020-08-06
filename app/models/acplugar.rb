class Acplugar < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  belongs_to :acp, class_name: '::Acp'
  belongs_to :departamento, class_name: 'Sip::Departamento',
    foreign_key: 'departamento_id'
  belongs_to :municipio, class_name: 'Sip::Municipio',
    foreign_key: 'municipio_id'

  validates :departamento_id, presence: true
  validates :municipio, uniqueness: {
    scope: [:departamento_id, :acp_id]}




  def presenta_nombre
    r = "#{departamento.nombre}"
    if municipio
     r += " - #{municipolugar}"
    end
    return r
  end
end
