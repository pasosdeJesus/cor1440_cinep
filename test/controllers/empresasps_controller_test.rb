require 'test_helper'

class EmpresaspsControllerTest < ActionController::TestCase
  setup do
    skip
    @empresaps = Empresaps(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:empresaps)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create empresaps" do
    skip
    assert_difference('Empresaps.count') do
      post :create, empresaps: { created_at: @empresaps.created_at, fechacreacion: @empresaps.fechacreacion, fechadeshabilitacion: @empresaps.fechadeshabilitacion, nombre: @empresaps.nombre, observaciones: @empresaps.observaciones, updated_at: @empresaps.updated_at }
    end

    assert_redirected_to empresaps_path(assigns(:empresaps))
  end

  test "should show empresaps" do
    skip
    get :show, id: @empresaps
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @empresaps
    assert_response :success
  end

  test "should update empresaps" do
    skip
    patch :update, id: @empresaps, empresaps: { created_at: @empresaps.created_at, fechacreacion: @empresaps.fechacreacion, fechadeshabilitacion: @empresaps.fechadeshabilitacion, nombre: @empresaps.nombre, observaciones: @empresaps.observaciones, updated_at: @empresaps.updated_at }
    assert_redirected_to empresaps_path(assigns(:empresaps))
  end

  test "should destroy empresaps" do
    skip
    assert_difference('Empresaps.count', -1) do
      delete :destroy, id: @empresaps
    end

    assert_redirected_to empresapses_path
  end
end
