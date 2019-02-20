require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get :create" do
    get reviews_:create_url
    assert_response :success
  end

end
