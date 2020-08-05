# encoding: UTF-8

require 'test_helper'

class Acpactor2Test < ActiveSupport::TestCase

  PRUEBA_ACPACTOR2 = {
    nombre: "Acpactor2",
    fechacreacion: "2020-08-05",
    created_at: "2020-08-05"
  }

  test "valido" do
    acpactor2 = ::Acpactor2.create(
      PRUEBA_ACPACTOR2)
    assert(acpactor2.valid?)
    acpactor2.destroy
  end

  test "no valido" do
    acpactor2 = ::Acpactor2.new(
      PRUEBA_ACPACTOR2)
    acpactor2.nombre = ''
    assert_not(acpactor2.valid?)
    acpactor2.destroy
  end

  test "existente" do
    skip
    acpactor2 = ::Acpactor2.where(id: 0).take
    assert_equal(acpactor2.nombre, "SIN INFORMACIÓN")
  end

end
