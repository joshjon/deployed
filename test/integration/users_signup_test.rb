require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { username:  "",
                                         password:              "password123",
                                         password_confirmation: "password456" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
      post users_path, params: { user: { username:  "gerald",
                                         password:              "Geraldlim@1",
                                         password_confirmation: "Geraldlim@1" } }
    end
    follow_redirect!
    # assert is_logged_in?
  end
end