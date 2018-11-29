require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @location = locations(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get locations_url
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post locations_url, params: { location: { city: @location.city, country: @location.country, state: @location.state } }
    end
    assert_redirected_to locations_url
  end

  test "should get edit" do
    get edit_location_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { city: @location.city, country: @location.country, state: @location.state } }
    assert_redirected_to locations_url
  end

end
