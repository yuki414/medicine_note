require 'test_helper'

class SideEffectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get side_effects_new_url
    assert_response :success
  end

  test "should get show" do
    get side_effects_show_url
    assert_response :success
  end

  test "should get create" do
    get side_effects_create_url
    assert_response :success
  end

end
