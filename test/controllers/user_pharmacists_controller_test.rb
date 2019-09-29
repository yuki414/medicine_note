require 'test_helper'

class UserPharmacistsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_pharmacists_show_url
    assert_response :success
  end

end
