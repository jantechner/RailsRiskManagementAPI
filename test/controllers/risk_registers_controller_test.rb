require 'test_helper'

class RiskRegistersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get risk_registers_index_url
    assert_response :success
  end

  test "should get show" do
    get risk_registers_show_url
    assert_response :success
  end

  test "should get create" do
    get risk_registers_create_url
    assert_response :success
  end

  test "should get update" do
    get risk_registers_update_url
    assert_response :success
  end

  test "should get delete" do
    get risk_registers_delete_url
    assert_response :success
  end

end
