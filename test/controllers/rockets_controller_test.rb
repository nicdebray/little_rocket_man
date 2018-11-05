require 'test_helper'

class RocketsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get rockets_new_url
    assert_response :success
  end

  test "should get index" do
    get rockets_index_url
    assert_response :success
  end

  test "should get create" do
    get rockets_create_url
    assert_response :success
  end

  test "should get show" do
    get rockets_show_url
    assert_response :success
  end

  test "should get edit" do
    get rockets_edit_url
    assert_response :success
  end

  test "should get update" do
    get rockets_update_url
    assert_response :success
  end

  test "should get destroy" do
    get rockets_destroy_url
    assert_response :success
  end

end
