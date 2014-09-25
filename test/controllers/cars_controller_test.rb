require 'test_helper'


class CarsControllerTest < ActionController::TestCase
  #clude Devise::TestHelpers

  setup do
    @car = cars(:one)
  end

  test "should be signed in to index cars" do
    get :index
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get index when signed in" do
    sign_in users(:gaylen)
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


  test "should be signed in to create a car" do
    post :create, car: { body_style: @car.body_style, distance_unit: @car.distance_unit, doors: @car.doors, drive_type: @car.drive_type, engine: @car.engine, fuel_unit: @car.fuel_unit, license_number: @car.license_number, license_state: @car.license_state, location_id: @car.location_id, model: @car.model, model_make: @car.model_make, model_trim: @car.model_trim, model_year: @car.model_year, user_id: @car.user_id, vehicle_type: @car.vehicle_type, vin: @car.vin }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create car when signed in" do
    sign_in users(:gaylen)
    assert_difference('Car.count') do
      post :create, car: { body_style: @car.body_style, distance_unit: @car.distance_unit, doors: @car.doors, drive_type: @car.drive_type, engine: @car.engine, fuel_unit: @car.fuel_unit, license_number: @car.license_number, license_state: @car.license_state, location_id: @car.location_id, model: @car.model, model_make: @car.model_make, model_trim: @car.model_trim, model_year: @car.model_year, user_id: @car.user_id, vehicle_type: @car.vehicle_type, vin: @car.vin }
    end

    assert_redirected_to car_path(assigns(:car))
  end


  test "should be signed in to show a car" do
    get :show, id: @car
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should show car when signed in" do
    sign_in users(:gaylen)
    get :show, id: @car
    assert_response :success
  end


  test "should be signed in to edit a car" do
    get :edit, id: @car
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when signed in" do
    sign_in users(:gaylen)
    get :edit, id: @car
    assert_response :success
  end

  
  test "should be signed in to update a car" do
    get :update, id: @car
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update car" do
    sign_in users(:gaylen)
    patch :update, id: @car, car: { body_style: @car.body_style, distance_unit: @car.distance_unit, doors: @car.doors, drive_type: @car.drive_type, engine: @car.engine, fuel_unit: @car.fuel_unit, license_number: @car.license_number, license_state: @car.license_state, location_id: @car.location_id, model: @car.model, model_make: @car.model_make, model_trim: @car.model_trim, model_year: @car.model_year, user_id: @car.user_id, vehicle_type: @car.vehicle_type, vin: @car.vin }
    assert_redirected_to car_path(assigns(:car))
  end


  test "should be signed in to destroy a car" do
    delete :destroy, id: @car
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should destroy car when signed in" do
    sign_in users(:gaylen)
    assert_difference('Car.count', -1) do
      delete :destroy, id: @car
    end

    assert_redirected_to cars_path
  end


  test "only show Gaylen's cars" do
    sign_in users(:gaylen)
    get :index
    assigns(:cars).each do |car|
      assert_equal users(:gaylen), car.user
    end
  end

  test "only show Shelley's cars" do
    sign_in users(:shelley)
    get :index
    assigns(:cars).each do |car|
      assert_equal users(:shelley), car.user
    end
  end

end
