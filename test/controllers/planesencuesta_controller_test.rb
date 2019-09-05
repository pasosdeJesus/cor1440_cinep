require 'test_helper'

class PlanesencuestaControllerTest < ActionController::TestCase
  setup do
    skip
    @planencuesta = Planencuesta(:one)
  end

  test "should get index" do
    skip
    get :index
    assert_response :success
    assert_not_nil assigns(:planencuesta)
  end

  test "should get new" do
    skip
    get :new
    assert_response :success
  end

  test "should create planencuesta" do
    skip
    assert_difference('Planencuesta.count') do
      post :create, planencuesta: { created_at: @planencuesta.created_at, fechacreacion: @planencuesta.fechacreacion, fechadeshabilitacion: @planencuesta.fechadeshabilitacion, nombre: @planencuesta.nombre, observaciones: @planencuesta.observaciones, updated_at: @planencuesta.updated_at }
    end

    assert_redirected_to planencuesta_path(assigns(:planencuesta))
  end

  test "should show planencuesta" do
    skip
    get :show, id: @planencuesta
    assert_response :success
  end

  test "should get edit" do
    skip
    get :edit, id: @planencuesta
    assert_response :success
  end

  test "should update planencuesta" do
    skip
    patch :update, id: @planencuesta, planencuesta: { created_at: @planencuesta.created_at, fechacreacion: @planencuesta.fechacreacion, fechadeshabilitacion: @planencuesta.fechadeshabilitacion, nombre: @planencuesta.nombre, observaciones: @planencuesta.observaciones, updated_at: @planencuesta.updated_at }
    assert_redirected_to planencuesta_path(assigns(:planencuesta))
  end

  test "should destroy planencuesta" do
    skip
    assert_difference('Planencuesta.count', -1) do
      delete :destroy, id: @planencuesta
    end

    assert_redirected_to planencuestaes_path
  end
end
