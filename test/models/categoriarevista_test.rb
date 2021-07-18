require 'test_helper'

class CategoriarevistaTest < ActiveSupport::TestCase

  PRUEBA_CATEGORIAREVISTA = {
    nombre: "Categoriarevista",
    fechacreacion: "2021-07-18",
    created_at: "2021-07-18"
  }

  test "valido" do
    categoriarevista = ::Categoriarevista.create(
      PRUEBA_CATEGORIAREVISTA)
    assert(categoriarevista.valid?)
    categoriarevista.destroy
  end

  test "no valido" do
    categoriarevista = ::Categoriarevista.new(
      PRUEBA_CATEGORIAREVISTA)
    categoriarevista.nombre = ''
    assert_not(categoriarevista.valid?)
    categoriarevista.destroy
  end

  test "existente" do
    categoriarevista = ::Categoriarevista.where(id: 1).take
    assert_equal(categoriarevista.nombre, "SIN INFORMACIÓN")
  end

end
