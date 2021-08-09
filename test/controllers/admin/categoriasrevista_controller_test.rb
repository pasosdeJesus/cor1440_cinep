require_relative '../../test_helper'

module Admin
  class CategoriasrevistaControllerTest < ActionDispatch::IntegrationTest

    CATEGORIAREVISTA_NUEVA = {
      created_at: '2021-07-18',
      fechacreacion: '2021-07-18',
      fechadeshabilitacion: nil,
      nombre: 'X',
      observaciones: 'y',
      updated_at: '2021-07-18'
    }

    include Rails.application.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup  do
      if ENV['CONFIG_HOSTS'] != 'www.example.com'
        raise 'CONFIG_HOSTS debe ser www.example.com'
      end
      @current_usuario = ::Usuario.find(1)
      sign_in @current_usuario
    end

    # Cada prueba se ejecuta se hace en una transacción
    # que después de la prueba se revierte
   
    test "debe presentar listado" do
      get main_app.admin_categoriasrevista_path
      assert_response :success
      assert_template :index
    end

    test "debe presentar resumen de existente" do
      get admin_categoriarevista_url(Categoriarevista.find(1))
      assert_response :success
      assert_template :show
    end

    test "debe presentar formulario para nueva" do
      get new_admin_categoriarevista_path
      assert_response :success
      assert_template :new
    end

    test "debe crear nueva" do
      assert_difference('Categoriarevista.count') do
        post admin_categoriasrevista_path, params: { 
          categoriarevista: CATEGORIAREVISTA_NUEVA
        }
      end

      assert_redirected_to admin_categoriarevista_path(
        assigns(:categoriarevista))
    end

    test "debe actualizar existente" do
      patch admin_categoriarevista_path(Categoriarevista.find(1)),
        params: { categoriarevista: { nombre: 'YY'}}

      assert_redirected_to admin_categoriarevista_path(
        assigns(:categoriarevista))
    end

    test "debe eliminar" do
      assert_difference('Categoriarevista.count', -1) do
        delete admin_categoriarevista_url(Categoriarevista.find(1))
      end

      assert_redirected_to admin_categoriasrevista_path
    end
  end
end
