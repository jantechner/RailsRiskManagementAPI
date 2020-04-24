require 'test_helper'

class RisksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get risks_index_url
    assert_response :success
  end

  test "should get show" do
    get risks_show_url
    assert_response :success
  end

  test "should get create" do
    get risks_create_url
    assert_response :success
  end

  test "should get update" do
    get risks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get risks_destroy_url
    assert_response :success
  end

end
