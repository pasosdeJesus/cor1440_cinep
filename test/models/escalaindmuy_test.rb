# encoding: UTF-8

require 'test_helper'

class EscalaindmuyTest < ActiveSupport::TestCase

  PRUEBA_ESCALAINDMUY = {
    nombre: "Escalaindmuy",
    fechacreacion: "2020-08-19",
    created_at: "2020-08-19"
  }

  test "valido" do
    escalaindmuy = ::Escalaindmuy.create(
      PRUEBA_ESCALAINDMUY)
    assert(escalaindmuy.valid?)
    escalaindmuy.destroy
  end

  test "no valido" do
    escalaindmuy = ::Escalaindmuy.new(
      PRUEBA_ESCALAINDMUY)
    escalaindmuy.nombre = ''
    assert_not(escalaindmuy.valid?)
    escalaindmuy.destroy
  end

  test "existente" do
    skip
    escalaindmuy = ::Escalaindmuy.where(id: 0).take
    assert_equal(escalaindmuy.nombre, "SIN INFORMACIÓN")
  end

end
