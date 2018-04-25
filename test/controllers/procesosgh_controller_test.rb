require 'test_helper'

class ProcesosghControllerTest < ActionController::TestCase
  setup do
    skip
    @procesogh = Procesogh(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:procesogh)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create procesogh" do
    skip
    assert_difference('Procesogh.count') do
      post :create, procesogh: { created_at: @procesogh.created_at, fechacreacion: @procesogh.fechacreacion, fechadeshabilitacion: @procesogh.fechadeshabilitacion, nombre: @procesogh.nombre, observaciones: @procesogh.observaciones, updated_at: @procesogh.updated_at }
    end

    assert_redirected_to procesogh_path(assigns(:procesogh))
  end

  test "should show procesogh" do
    skip
    get :show, id: @procesogh
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @procesogh
    assert_response :success
  end

  test "should update procesogh" do
    skip
    patch :update, id: @procesogh, procesogh: { created_at: @procesogh.created_at, fechacreacion: @procesogh.fechacreacion, fechadeshabilitacion: @procesogh.fechadeshabilitacion, nombre: @procesogh.nombre, observaciones: @procesogh.observaciones, updated_at: @procesogh.updated_at }
    assert_redirected_to procesogh_path(assigns(:procesogh))
  end

  test "should destroy procesogh" do
    skip
    assert_difference('Procesogh.count', -1) do
      delete :destroy, id: @procesogh
    end

    assert_redirected_to procesoghes_path
  end
end
