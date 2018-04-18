require 'test_helper'

class TiposcontratosControllerTest < ActionController::TestCase
  setup do
    skip
    @tipocontrato = Tipocontrato(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:tipocontrato)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create tipocontrato" do
    skip
    assert_difference('Tipocontrato.count') do
      post :create, tipocontrato: { created_at: @tipocontrato.created_at, fechacreacion: @tipocontrato.fechacreacion, fechadeshabilitacion: @tipocontrato.fechadeshabilitacion, nombre: @tipocontrato.nombre, observaciones: @tipocontrato.observaciones, updated_at: @tipocontrato.updated_at }
    end

    assert_redirected_to tipocontrato_path(assigns(:tipocontrato))
  end

  test "should show tipocontrato" do
    skip
    get :show, id: @tipocontrato
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @tipocontrato
    assert_response :success
  end

  test "should update tipocontrato" do
    skip
    patch :update, id: @tipocontrato, tipocontrato: { created_at: @tipocontrato.created_at, fechacreacion: @tipocontrato.fechacreacion, fechadeshabilitacion: @tipocontrato.fechadeshabilitacion, nombre: @tipocontrato.nombre, observaciones: @tipocontrato.observaciones, updated_at: @tipocontrato.updated_at }
    assert_redirected_to tipocontrato_path(assigns(:tipocontrato))
  end

  test "should destroy tipocontrato" do
    skip
    assert_difference('Tipocontrato.count', -1) do
      delete :destroy, id: @tipocontrato
    end

    assert_redirected_to tipocontratoes_path
  end
end
