require 'test_helper'

class RenterControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get renter_new_url
    assert_response :success
  end

  test "should get create" do
    get renter_create_url
    assert_response :success
  end

  test "should get show" do
    get renter_show_url
    assert_response :success
  end

  test "should get edit" do
    get renter_edit_url
    assert_response :success
  end

  test "should get update" do
    get renter_update_url
    assert_response :success
  end

end
