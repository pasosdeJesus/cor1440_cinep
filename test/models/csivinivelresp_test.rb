# encoding: UTF-8

require 'test_helper'

class CsivinivelrespTest < ActiveSupport::TestCase

  PRUEBA_CSIVINIVELRESP = {
    nombre: "Csivinivelresp",
    fechacreacion: "2020-08-07",
    created_at: "2020-08-07"
  }

  test "valido" do
    csivinivelresp = ::Csivinivelresp.create(
      PRUEBA_CSIVINIVELRESP)
    assert(csivinivelresp.valid?)
    csivinivelresp.destroy
  end

  test "no valido" do
    csivinivelresp = ::Csivinivelresp.new(
      PRUEBA_CSIVINIVELRESP)
    csivinivelresp.nombre = ''
    assert_not(csivinivelresp.valid?)
    csivinivelresp.destroy
  end

  test "existente" do
    skip
    csivinivelresp = ::Csivinivelresp.where(id: 0).take
    assert_equal(csivinivelresp.nombre, "SIN INFORMACIÓN")
  end

end
