# encoding: UTF-8

require 'test_helper'

class AcpestrategiaTest < ActiveSupport::TestCase

  PRUEBA_ACPESTRATEGIA = {
    nombre: "Acpestrategia",
    fechacreacion: "2020-07-14",
    created_at: "2020-07-14"
  }

  test "valido" do
    acpestrategia = ::Acpestrategia.create(
      PRUEBA_ACPESTRATEGIA)
    assert(acpestrategia.valid?)
    acpestrategia.destroy
  end

  test "no valido" do
    acpestrategia = ::Acpestrategia.new(
      PRUEBA_ACPESTRATEGIA)
    acpestrategia.nombre = ''
    assert_not(acpestrategia.valid?)
    acpestrategia.destroy
  end

  test "existente" do
    skip
    acpestrategia = ::Acpestrategia.where(id: 0).take
    assert_equal(acpestrategia.nombre, "SIN INFORMACIÓN")
  end

end
