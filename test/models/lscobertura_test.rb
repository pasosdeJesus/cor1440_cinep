# encoding: UTF-8

require 'test_helper'

class LscoberturaTest < ActiveSupport::TestCase

  PRUEBA_LSCOBERTURA = {
    nombre: "Lscobertura",
    codigo: "LS",
    fechacreacion: "2020-07-22",
    created_at: "2020-07-22"
  }

  test "valido" do
    lscobertura = ::Lscobertura.create(
      PRUEBA_LSCOBERTURA)
    assert(lscobertura.valid?)
    lscobertura.destroy
  end

  test "no valido" do
    lscobertura = ::Lscobertura.new(
      PRUEBA_LSCOBERTURA)
    lscobertura.nombre = ''
    assert_not(lscobertura.valid?)
    lscobertura.destroy
  end

  test "existente" do
    skip
    lscobertura = ::Lscobertura.where(id: 0).take
    assert_equal(lscobertura.nombre, "SIN INFORMACIÓN")
  end

end
