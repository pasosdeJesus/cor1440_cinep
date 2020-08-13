# encoding: UTF-8

require 'test_helper'

class AcpformapTest < ActiveSupport::TestCase

  PRUEBA_ACPFORMAP = {
    nombre: "Acpformap",
    fechacreacion: "2020-08-05",
    created_at: "2020-08-05"
  }

  test "valido" do
    acpformap = ::Acpformap.create(
      PRUEBA_ACPFORMAP)
    assert(acpformap.valid?)
    acpformap.destroy
  end

  test "no valido" do
    acpformap = ::Acpformap.new(
      PRUEBA_ACPFORMAP)
    acpformap.nombre = ''
    assert_not(acpformap.valid?)
    acpformap.destroy
  end

  test "existente" do
    skip
    acpformap = ::Acpformap.where(id: 0).take
    assert_equal(acpformap.nombre, "SIN INFORMACIÓN")
  end

end
