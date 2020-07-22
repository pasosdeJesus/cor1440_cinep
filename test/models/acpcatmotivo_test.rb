# encoding: UTF-8

require 'test_helper'

class AcpcatmotivoTest < ActiveSupport::TestCase

  PRUEBA_ACPCATMOT = {
    nombre: "Acpcatmotivo",
    fechacreacion: "2020-07-15",
    created_at: "2020-07-15"
  }

  test "valido" do
    acpcatmotivo = ::Acpcatmotivo.create(
      PRUEBA_ACPCATMOT)
    assert(acpcatmotivo.valid?)
    acpcatmotivo.destroy
  end

  test "no valido" do
    acpcatmotivo = ::Acpcatmotivo.new(
      PRUEBA_ACPCATMOT)
    acpcatmotivo.nombre = ''
    assert_not(acpcatmotivo.valid?)
    acpcatmotivo.destroy
  end

  test "existente" do
    skip
    acpcatmotivo = ::Acpcatmotivo.where(id: 0).take
    assert_equal(acpcatmotivo.nombre, "SIN INFORMACIÓN")
  end

end
