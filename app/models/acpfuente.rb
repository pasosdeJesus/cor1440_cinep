class Acpfuente < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  campofecha_localizado :ffuente

  belongs_to :acp, class_name: '::Acp'

  validates :fuente, presence: true, length: {maximum: 127}
  validates :pagina, length: {maximum: 63}
  validates :ffuente, presence: true


  def presenta_nombre
    "#{ffuente} #{fuente} #{pagina}"
  end
end
