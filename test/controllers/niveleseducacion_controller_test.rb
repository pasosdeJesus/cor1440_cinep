require 'test_helper'

class NiveleseducacionControllerTest < ActionController::TestCase
  setup do
    skip
    @niveleducacion = Niveleducacion(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:niveleducacion)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create niveleducacion" do
    skip
    assert_difference('Niveleducacion.count') do
      post :create, niveleducacion: { created_at: @niveleducacion.created_at, fechacreacion: @niveleducacion.fechacreacion, fechadeshabilitacion: @niveleducacion.fechadeshabilitacion, nombre: @niveleducacion.nombre, observaciones: @niveleducacion.observaciones, updated_at: @niveleducacion.updated_at }
    end

    assert_redirected_to niveleducacion_path(assigns(:niveleducacion))
  end

  test "should show niveleducacion" do
    skip
    get :show, id: @niveleducacion
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @niveleducacion
    assert_response :success
  end

  test "should update niveleducacion" do
    skip
    patch :update, id: @niveleducacion, niveleducacion: { created_at: @niveleducacion.created_at, fechacreacion: @niveleducacion.fechacreacion, fechadeshabilitacion: @niveleducacion.fechadeshabilitacion, nombre: @niveleducacion.nombre, observaciones: @niveleducacion.observaciones, updated_at: @niveleducacion.updated_at }
    assert_redirected_to niveleducacion_path(assigns(:niveleducacion))
  end

  test "should destroy niveleducacion" do
    skip
    assert_difference('Niveleducacion.count', -1) do
      delete :destroy, id: @niveleducacion
    end

    assert_redirected_to niveleducaciones_path
  end
end
