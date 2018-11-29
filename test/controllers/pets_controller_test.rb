require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @pet = pets(:one)
    sign_in users(:one)
  end

  test "should show pet" do
    get pet_url(@pet)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_url(@pet)
    assert_response :success
  end

  test "should update pet" do
    patch pet_url(@pet), params: { pet: { date_of_birth: @pet.date_of_birth, location_id: @pet.location_id, names: @pet.names, rating: @pet.rating, user_id: @pet.user_id } }
    assert_redirected_to pet_url(@pet)
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete pet_url(@pet)
    end
    assert_redirected_to users_url
  end
end
