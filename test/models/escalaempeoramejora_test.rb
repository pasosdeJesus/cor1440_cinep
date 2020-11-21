# encoding: UTF-8

require 'test_helper'

class EscalaempeoramejoraTest < ActiveSupport::TestCase

  PRUEBA_ESCALAEMPEORAMEJORA = {
    nombre: "Escalaempeoramejora",
    fechacreacion: "2020-08-19",
    created_at: "2020-08-19"
  }

  test "valido" do
    escalaempeoramejora = ::Escalaempeoramejora.create(
      PRUEBA_ESCALAEMPEORAMEJORA)
    assert(escalaempeoramejora.valid?)
    escalaempeoramejora.destroy
  end

  test "no valido" do
    escalaempeoramejora = ::Escalaempeoramejora.new(
      PRUEBA_ESCALAEMPEORAMEJORA)
    escalaempeoramejora.nombre = ''
    assert_not(escalaempeoramejora.valid?)
    escalaempeoramejora.destroy
  end

  test "existente" do
    skip
    escalaempeoramejora = ::Escalaempeoramejora.where(id: 0).take
    assert_equal(escalaempeoramejora.nombre, "SIN INFORMACIÓN")
  end

end
