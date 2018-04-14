require 'test_helper'

class PerfilesprofesionalesControllerTest < ActionController::TestCase
  setup do
    skip
    @perfilprofesional = Perfilprofesional(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:perfilprofesional)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create perfilprofesional" do
    skip
    assert_difference('Perfilprofesional.count') do
      post :create, perfilprofesional: { created_at: @perfilprofesional.created_at, fechacreacion: @perfilprofesional.fechacreacion, fechadeshabilitacion: @perfilprofesional.fechadeshabilitacion, nombre: @perfilprofesional.nombre, observaciones: @perfilprofesional.observaciones, updated_at: @perfilprofesional.updated_at }
    end

    assert_redirected_to perfilprofesional_path(assigns(:perfilprofesional))
  end

  test "should show perfilprofesional" do
    skip
    get :show, id: @perfilprofesional
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @perfilprofesional
    assert_response :success
  end

  test "should update perfilprofesional" do
    skip
    patch :update, id: @perfilprofesional, perfilprofesional: { created_at: @perfilprofesional.created_at, fechacreacion: @perfilprofesional.fechacreacion, fechadeshabilitacion: @perfilprofesional.fechadeshabilitacion, nombre: @perfilprofesional.nombre, observaciones: @perfilprofesional.observaciones, updated_at: @perfilprofesional.updated_at }
    assert_redirected_to perfilprofesional_path(assigns(:perfilprofesional))
  end

  test "should destroy perfilprofesional" do
    skip
    assert_difference('Perfilprofesional.count', -1) do
      delete :destroy, id: @perfilprofesional
    end

    assert_redirected_to perfilprofesionales_path
  end
end
