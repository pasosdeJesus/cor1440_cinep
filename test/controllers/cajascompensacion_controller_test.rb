require 'test_helper'

class CajascompensacionControllerTest < ActionController::TestCase
  setup do
    skip
    @cajacompensacion = Cajacompensacion(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:cajacompensacion)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create cajacompensacion" do
    skip
    assert_difference('Cajacompensacion.count') do
      post :create, cajacompensacion: { created_at: @cajacompensacion.created_at, fechacreacion: @cajacompensacion.fechacreacion, fechadeshabilitacion: @cajacompensacion.fechadeshabilitacion, nombre: @cajacompensacion.nombre, observaciones: @cajacompensacion.observaciones, updated_at: @cajacompensacion.updated_at }
    end

    assert_redirected_to cajacompensacion_path(assigns(:cajacompensacion))
  end

  test "should show cajacompensacion" do
    skip
    get :show, id: @cajacompensacion
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @cajacompensacion
    assert_response :success
  end

  test "should update cajacompensacion" do
    skip
    patch :update, id: @cajacompensacion, cajacompensacion: { created_at: @cajacompensacion.created_at, fechacreacion: @cajacompensacion.fechacreacion, fechadeshabilitacion: @cajacompensacion.fechadeshabilitacion, nombre: @cajacompensacion.nombre, observaciones: @cajacompensacion.observaciones, updated_at: @cajacompensacion.updated_at }
    assert_redirected_to cajacompensacion_path(assigns(:cajacompensacion))
  end

  test "should destroy cajacompensacion" do
    skip
    assert_difference('Cajacompensacion.count', -1) do
      delete :destroy, id: @cajacompensacion
    end

    assert_redirected_to cajacompensaciones_path
  end
end
