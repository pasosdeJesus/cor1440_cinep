# encoding: UTF-8

require 'test_helper'

class Acpactor1Test < ActiveSupport::TestCase

  PRUEBA_ACPACTOR1 = {
    nombre: "Acpactor1",
    fechacreacion: "2020-08-05",
    created_at: "2020-08-05"
  }

  test "valido" do
    acpactor1 = ::Acpactor1.create(
      PRUEBA_ACPACTOR1)
    assert(acpactor1.valid?)
    acpactor1.destroy
  end

  test "no valido" do
    acpactor1 = ::Acpactor1.new(
      PRUEBA_ACPACTOR1)
    acpactor1.nombre = ''
    assert_not(acpactor1.valid?)
    acpactor1.destroy
  end

  test "existente" do
    acpactor1 = ::Acpactor1.where(id: 1).take
    assert_equal(acpactor1.nombre, "SIN INFORMACIÓN")
  end

end
