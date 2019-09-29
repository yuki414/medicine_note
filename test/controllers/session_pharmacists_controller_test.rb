require 'test_helper'

class SessionPharmacistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get session_pharmacists_new_url
    assert_response :success
  end

end
