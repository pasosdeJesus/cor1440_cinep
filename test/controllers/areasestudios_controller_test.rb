require 'test_helper'

class AreasestudiosControllerTest < ActionController::TestCase
  setup do
    skip
    @areaestudios = Areaestudios(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:areaestudios)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create areaestudios" do
    skip
    assert_difference('Areaestudios.count') do
      post :create, areaestudios: { created_at: @areaestudios.created_at, fechacreacion: @areaestudios.fechacreacion, fechadeshabilitacion: @areaestudios.fechadeshabilitacion, nombre: @areaestudios.nombre, observaciones: @areaestudios.observaciones, updated_at: @areaestudios.updated_at }
    end

    assert_redirected_to areaestudios_path(assigns(:areaestudios))
  end

  test "should show areaestudios" do
    skip
    get :show, id: @areaestudios
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @areaestudios
    assert_response :success
  end

  test "should update areaestudios" do
    skip
    patch :update, id: @areaestudios, areaestudios: { created_at: @areaestudios.created_at, fechacreacion: @areaestudios.fechacreacion, fechadeshabilitacion: @areaestudios.fechadeshabilitacion, nombre: @areaestudios.nombre, observaciones: @areaestudios.observaciones, updated_at: @areaestudios.updated_at }
    assert_redirected_to areaestudios_path(assigns(:areaestudios))
  end

  test "should destroy areaestudios" do
    skip
    assert_difference('Areaestudios.count', -1) do
      delete :destroy, id: @areaestudios
    end

    assert_redirected_to areaestudioses_path
  end
end
