require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: {user: { name: '', email: 'zz', password: 'zug', password_confirmation: 'zuggo' } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
  end

  test "valid signup" do
    get signup_path
    assert_difference 'User.count' do
      post users_path, params: {user: { name: 'Zorg', email: 'z@z.com', password: 'zug'*3, password_confirmation: 'zug'*3 } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.alert
  end
    
  
end
