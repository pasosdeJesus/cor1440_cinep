# encoding: UTF-8

require 'test_helper'

class EscaladebilfuerteTest < ActiveSupport::TestCase

  PRUEBA_ESCALADEBILFUERTE = {
    nombre: "Escaladebilfuerte",
    fechacreacion: "2020-08-19",
    created_at: "2020-08-19"
  }

  test "valido" do
    escaladebilfuerte = ::Escaladebilfuerte.create(
      PRUEBA_ESCALADEBILFUERTE)
    assert(escaladebilfuerte.valid?)
    escaladebilfuerte.destroy
  end

  test "no valido" do
    escaladebilfuerte = ::Escaladebilfuerte.new(
      PRUEBA_ESCALADEBILFUERTE)
    escaladebilfuerte.nombre = ''
    assert_not(escaladebilfuerte.valid?)
    escaladebilfuerte.destroy
  end

  test "existente" do
    skip
    escaladebilfuerte = ::Escaladebilfuerte.where(id: 0).take
    assert_equal(escaladebilfuerte.nombre, "SIN INFORMACIÓN")
  end

end
