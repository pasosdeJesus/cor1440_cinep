# encoding: UTF-8

require 'test_helper'

class CsivitemaTest < ActiveSupport::TestCase

  PRUEBA_CSIVITEMA = {
    nombre: "Csivitema",
    fechacreacion: "2020-08-07",
    created_at: "2020-08-07"
  }

  test "valido" do
    csivitema = ::Csivitema.create(
      PRUEBA_CSIVITEMA)
    assert(csivitema.valid?)
    csivitema.destroy
  end

  test "no valido" do
    csivitema = ::Csivitema.new(
      PRUEBA_CSIVITEMA)
    csivitema.nombre = ''
    assert_not(csivitema.valid?)
    csivitema.destroy
  end

  test "existente" do
    skip
    csivitema = ::Csivitema.where(id: 0).take
    assert_equal(csivitema.nombre, "SIN INFORMACIÓN")
  end

end
