require "test_helper"

class PlantsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get plants_home_url
    assert_response :success
  end
end
