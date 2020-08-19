# encoding: UTF-8

require 'test_helper'

class Escalaaltura3Test < ActiveSupport::TestCase

  PRUEBA_ESCALAALTURA3 = {
    nombre: "Escalaaltura3",
    fechacreacion: "2020-08-19",
    created_at: "2020-08-19"
  }

  test "valido" do
    escalaaltura3 = ::Escalaaltura3.create(
      PRUEBA_ESCALAALTURA3)
    assert(escalaaltura3.valid?)
    escalaaltura3.destroy
  end

  test "no valido" do
    escalaaltura3 = ::Escalaaltura3.new(
      PRUEBA_ESCALAALTURA3)
    escalaaltura3.nombre = ''
    assert_not(escalaaltura3.valid?)
    escalaaltura3.destroy
  end

  test "existente" do
    skip
    escalaaltura3 = ::Escalaaltura3.where(id: 0).take
    assert_equal(escalaaltura3.nombre, "SIN INFORMACIÓN")
  end

end
