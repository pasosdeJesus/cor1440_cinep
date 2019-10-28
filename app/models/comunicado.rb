# encoding: UTF-8

class Comunicado < ActiveRecord::Base
  include Sip::Basica

  has_rich_text :contenido
  validates :contenido, length: { maximum: 5000 }
  validates :nombre, format: { with: /\A[a-z_][a-z_0-9]+\z/,
    message: "sólo se permiten mínusculas, dígitos y _" },
    uniqueness: true

  # Sobrecarg asignación que convierte a mayúscula
  def nombre=(val)
    self[:nombre] = val
  end

end
