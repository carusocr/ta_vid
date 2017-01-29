require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: {user: { name: '', email: 'zz', password: 'zug', password_confirmation: 'zuggo' } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
  end

  test "valid signup information" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: {user: { name: "Zorg", email: "zzz@zz.com", password: "zugzugzug", password_confirmation: "zugzugzug" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

  test "user count" do
    assert_equal 1, User.count
    get signup_path
  end
    
  
end
