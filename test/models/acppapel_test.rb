# encoding: UTF-8

require 'test_helper'

class AcppapelTest < ActiveSupport::TestCase

  PRUEBA_ACPPAPEL = {
    nombre: "Acppapel",
    fechacreacion: "2020-08-05",
    created_at: "2020-08-05"
  }

  test "valido" do
    acppapel = ::Acppapel.create(
      PRUEBA_ACPPAPEL)
    assert(acppapel.valid?)
    acppapel.destroy
  end

  test "no valido" do
    acppapel = ::Acppapel.new(
      PRUEBA_ACPPAPEL)
    acppapel.nombre = ''
    assert_not(acppapel.valid?)
    acppapel.destroy
  end

  test "existente" do
    skip
    acppapel = ::Acppapel.where(id: 0).take
    assert_equal(acppapel.nombre, "SIN INFORMACIÓN")
  end

end
