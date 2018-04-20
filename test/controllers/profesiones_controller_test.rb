require 'test_helper'

class ProfesionesControllerTest < ActionController::TestCase
  setup do
    skip
    @profesion = Profesion(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:profesion)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create profesion" do
    skip
    assert_difference('Profesion.count') do
      post :create, profesion: { created_at: @profesion.created_at, fechacreacion: @profesion.fechacreacion, fechadeshabilitacion: @profesion.fechadeshabilitacion, nombre: @profesion.nombre, observaciones: @profesion.observaciones, updated_at: @profesion.updated_at }
    end

    assert_redirected_to profesion_path(assigns(:profesion))
  end

  test "should show profesion" do
    skip
    get :show, id: @profesion
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @profesion
    assert_response :success
  end

  test "should update profesion" do
    skip
    patch :update, id: @profesion, profesion: { created_at: @profesion.created_at, fechacreacion: @profesion.fechacreacion, fechadeshabilitacion: @profesion.fechadeshabilitacion, nombre: @profesion.nombre, observaciones: @profesion.observaciones, updated_at: @profesion.updated_at }
    assert_redirected_to profesion_path(assigns(:profesion))
  end

  test "should destroy profesion" do
    skip
    assert_difference('Profesion.count', -1) do
      delete :destroy, id: @profesion
    end

    assert_redirected_to profesiones_path
  end
end
