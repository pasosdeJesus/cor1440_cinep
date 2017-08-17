require 'test_helper'

class ConveniosControllerTest < ActionController::TestCase
  setup do
    skip
    @convenio = Convenio(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:convenio)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create convenio" do
    skip
    assert_difference('Convenio.count') do
      post :create, convenio: { created_at: @convenio.created_at, fechacreacion: @convenio.fechacreacion, fechadeshabilitacion: @convenio.fechadeshabilitacion, nombre: @convenio.nombre, observaciones: @convenio.observaciones, updated_at: @convenio.updated_at }
    end

    assert_redirected_to convenio_path(assigns(:convenio))
  end

  test "should show convenio" do
    skip
    get :show, id: @convenio
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @convenio
    assert_response :success
  end

  test "should update convenio" do
    skip
    patch :update, id: @convenio, convenio: { created_at: @convenio.created_at, fechacreacion: @convenio.fechacreacion, fechadeshabilitacion: @convenio.fechadeshabilitacion, nombre: @convenio.nombre, observaciones: @convenio.observaciones, updated_at: @convenio.updated_at }
    assert_redirected_to convenio_path(assigns(:convenio))
  end

  test "should destroy convenio" do
    skip
    assert_difference('Convenio.count', -1) do
      delete :destroy, id: @convenio
    end

    assert_redirected_to convenioes_path
  end
end
