require 'test_helper'

class FondospensionesControllerTest < ActionController::TestCase
  setup do
    skip
    @fondopensiones = Fondopensiones(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:fondopensiones)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create fondopensiones" do
    skip
    assert_difference('Fondopensiones.count') do
      post :create, fondopensiones: { created_at: @fondopensiones.created_at, fechacreacion: @fondopensiones.fechacreacion, fechadeshabilitacion: @fondopensiones.fechadeshabilitacion, nombre: @fondopensiones.nombre, observaciones: @fondopensiones.observaciones, updated_at: @fondopensiones.updated_at }
    end

    assert_redirected_to fondopensiones_path(assigns(:fondopensiones))
  end

  test "should show fondopensiones" do
    skip
    get :show, id: @fondopensiones
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @fondopensiones
    assert_response :success
  end

  test "should update fondopensiones" do
    skip
    patch :update, id: @fondopensiones, fondopensiones: { created_at: @fondopensiones.created_at, fechacreacion: @fondopensiones.fechacreacion, fechadeshabilitacion: @fondopensiones.fechadeshabilitacion, nombre: @fondopensiones.nombre, observaciones: @fondopensiones.observaciones, updated_at: @fondopensiones.updated_at }
    assert_redirected_to fondopensiones_path(assigns(:fondopensiones))
  end

  test "should destroy fondopensiones" do
    skip
    assert_difference('Fondopensiones.count', -1) do
      delete :destroy, id: @fondopensiones
    end

    assert_redirected_to fondopensioneses_path
  end
end
