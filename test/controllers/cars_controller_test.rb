require 'test_helper'


class CarsControllerTest < ActionController::TestCase
  #clude Devise::TestHelpers

  setup do
    @car = cars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cars)
  end

  test "should be redirected when not signed in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:gaylen)
    get :new
    assert_response :success
  end

  test "should create car" do
    assert_difference('Car.count') do
      post :create, car: { body_style: @car.body_style, distance_unit: @car.distance_unit, doors: @car.doors, drive_type: @car.drive_type, engine: @car.engine, fuel_unit: @car.fuel_unit, license_number: @car.license_number, license_state: @car.license_state, location_id: @car.location_id, model: @car.model, model_make: @car.model_make, model_trim: @car.model_trim, model_year: @car.model_year, user_id: @car.user_id, vehicle_type: @car.vehicle_type, vin: @car.vin }
    end

    assert_redirected_to car_path(assigns(:car))
  end

  test "should show car" do
    get :show, id: @car
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @car
    assert_response :success
  end

  test "should update car" do
    patch :update, id: @car, car: { body_style: @car.body_style, distance_unit: @car.distance_unit, doors: @car.doors, drive_type: @car.drive_type, engine: @car.engine, fuel_unit: @car.fuel_unit, license_number: @car.license_number, license_state: @car.license_state, location_id: @car.location_id, model: @car.model, model_make: @car.model_make, model_trim: @car.model_trim, model_year: @car.model_year, user_id: @car.user_id, vehicle_type: @car.vehicle_type, vin: @car.vin }
    assert_redirected_to car_path(assigns(:car))
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete :destroy, id: @car
    end

    assert_redirected_to cars_path
  end
end
