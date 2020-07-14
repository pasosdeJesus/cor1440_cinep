# encoding: UTF-8

require 'test_helper'

class AcpcoberturaTest < ActiveSupport::TestCase

  PRUEBA_ACPCOBERTURA = {
    nombre: "Acpcobertura",
    fechacreacion: "2020-07-14",
    created_at: "2020-07-14"
  }

  test "valido" do
    acpcobertura = ::Acpcobertura.create(
      PRUEBA_ACPCOBERTURA)
    assert(acpcobertura.valid?)
    acpcobertura.destroy
  end

  test "no valido" do
    acpcobertura = ::Acpcobertura.new(
      PRUEBA_ACPCOBERTURA)
    acpcobertura.nombre = ''
    assert_not(acpcobertura.valid?)
    acpcobertura.destroy
  end

  test "existente" do
    skip
    acpcobertura = ::Acpcobertura.where(id: 0).take
    assert_equal(acpcobertura.nombre, "SIN INFORMACIÓN")
  end

end
