require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  test 'index action should be success' do
    get :index
    assert_response :success
  end

  test 'show action should be success' do
    get :index, params: { id: 2 }
    assert_response :success
  end
end
