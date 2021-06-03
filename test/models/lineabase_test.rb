# encoding: UTF-8

require 'test_helper'

class LineabaseTest < ActiveSupport::TestCase

  PRUEBA_LINEABASE = {
    nombre: "Lineabase",
    fechacreacion: "2021-06-03",
    created_at: "2021-06-03"
  }

  test "valido" do
    lineabase = ::Lineabase.create(
      PRUEBA_LINEABASE)
    assert(lineabase.valid?)
    lineabase.destroy
  end

  test "no valido" do
    lineabase = ::Lineabase.new(
      PRUEBA_LINEABASE)
    lineabase.nombre = ''
    assert_not(lineabase.valid?)
    lineabase.destroy
  end

  test "existente" do
    lineabase = ::Lineabase.where(id: 1).take
    assert_equal(lineabase.nombre, "PLAN TRIENAL 2018-2020")
  end

end
