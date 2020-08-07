# encoding: UTF-8

require 'test_helper'

class CsivinivelgeoTest < ActiveSupport::TestCase

  PRUEBA_CSIVINIVELGEO = {
    nombre: "Csivinivelgeo",
    fechacreacion: "2020-08-07",
    created_at: "2020-08-07"
  }

  test "valido" do
    csivinivelgeo = ::Csivinivelgeo.create(
      PRUEBA_CSIVINIVELGEO)
    assert(csivinivelgeo.valid?)
    csivinivelgeo.destroy
  end

  test "no valido" do
    csivinivelgeo = ::Csivinivelgeo.new(
      PRUEBA_CSIVINIVELGEO)
    csivinivelgeo.nombre = ''
    assert_not(csivinivelgeo.valid?)
    csivinivelgeo.destroy
  end

  test "existente" do
    skip
    csivinivelgeo = ::Csivinivelgeo.where(id: 0).take
    assert_equal(csivinivelgeo.nombre, "SIN INFORMACIÓN")
  end

end
