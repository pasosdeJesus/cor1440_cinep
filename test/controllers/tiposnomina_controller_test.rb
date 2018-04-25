require 'test_helper'

class TiposnominaControllerTest < ActionController::TestCase
  setup do
    skip
    @tiponomina = Tiponomina(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:tiponomina)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create tiponomina" do
    skip
    assert_difference('Tiponomina.count') do
      post :create, tiponomina: { created_at: @tiponomina.created_at, fechacreacion: @tiponomina.fechacreacion, fechadeshabilitacion: @tiponomina.fechadeshabilitacion, nombre: @tiponomina.nombre, observaciones: @tiponomina.observaciones, updated_at: @tiponomina.updated_at }
    end

    assert_redirected_to tiponomina_path(assigns(:tiponomina))
  end

  test "should show tiponomina" do
    skip
    get :show, id: @tiponomina
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @tiponomina
    assert_response :success
  end

  test "should update tiponomina" do
    skip
    patch :update, id: @tiponomina, tiponomina: { created_at: @tiponomina.created_at, fechacreacion: @tiponomina.fechacreacion, fechadeshabilitacion: @tiponomina.fechadeshabilitacion, nombre: @tiponomina.nombre, observaciones: @tiponomina.observaciones, updated_at: @tiponomina.updated_at }
    assert_redirected_to tiponomina_path(assigns(:tiponomina))
  end

  test "should destroy tiponomina" do
    skip
    assert_difference('Tiponomina.count', -1) do
      delete :destroy, id: @tiponomina
    end

    assert_redirected_to tiponominaes_path
  end
end
