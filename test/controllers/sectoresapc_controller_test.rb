require 'test_helper'

class SectoresapcControllerTest < ActionController::TestCase
  setup do
    skip
    @sectorapc = Sectorapc(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:sectorapc)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create sectorapc" do
    skip
    assert_difference('Sectorapc.count') do
      post :create, sectorapc: { created_at: @sectorapc.created_at, fechacreacion: @sectorapc.fechacreacion, fechadeshabilitacion: @sectorapc.fechadeshabilitacion, nombre: @sectorapc.nombre, observaciones: @sectorapc.observaciones, updated_at: @sectorapc.updated_at }
    end

    assert_redirected_to sectorapc_path(assigns(:sectorapc))
  end

  test "should show sectorapc" do
    skip
    get :show, id: @sectorapc
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @sectorapc
    assert_response :success
  end

  test "should update sectorapc" do
    skip
    patch :update, id: @sectorapc, sectorapc: { created_at: @sectorapc.created_at, fechacreacion: @sectorapc.fechacreacion, fechadeshabilitacion: @sectorapc.fechadeshabilitacion, nombre: @sectorapc.nombre, observaciones: @sectorapc.observaciones, updated_at: @sectorapc.updated_at }
    assert_redirected_to sectorapc_path(assigns(:sectorapc))
  end

  test "should destroy sectorapc" do
    skip
    assert_difference('Sectorapc.count', -1) do
      delete :destroy, id: @sectorapc
    end

    assert_redirected_to sectorapces_path
  end
end
