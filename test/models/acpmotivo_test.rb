# encoding: UTF-8

require 'test_helper'

class AcpmotivoTest < ActiveSupport::TestCase

  PRUEBA_ACPMOTIVO = {
    nombre: "Acpmotivo",
    fechacreacion: "2020-07-14",
    created_at: "2020-07-14"
  }

  test "valido" do
    acpmotivo = ::Acpmotivo.create(
      PRUEBA_ACPMOTIVO)
    assert(acpmotivo.valid?)
    acpmotivo.destroy
  end

  test "no valido" do
    acpmotivo = ::Acpmotivo.new(
      PRUEBA_ACPMOTIVO)
    acpmotivo.nombre = ''
    assert_not(acpmotivo.valid?)
    acpmotivo.destroy
  end

  test "existente" do
    skip
    acpmotivo = ::Acpmotivo.where(id: 0).take
    assert_equal(acpmotivo.nombre, "SIN INFORMACIÓN")
  end

end
