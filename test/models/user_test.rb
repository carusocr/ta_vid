require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Zorg", email: "zorg@z.net", password: "zugzugzug", password_confirmation: "zugzugzug")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    assert @user.name = ""
    assert_not @user.valid?
  end

  test "name should not exceed 20 chars" do
    @user.name = "z" * 21
    assert_not @user.valid?
  end

  test "email should be present" do
    assert @user.email = ""
    assert_not @user.valid?
  end

  test "email should not be too long" do
    assert @user.email = "z" * 121
    assert_not @user.valid?
  end

  test "email should be valid format" do
    valids = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valids.each do |a|
      @user.email = a
      assert @user.valid?, "#{a.inspect} should be valid."
    end
  end

  test "email should reject invalid format" do
    invalids = %w[user@a,com user.at.foo.org hi_there zug@zug.test. zug@hm_huh.com c@c..com]
    invalids.each do |a|
      @user.email = a
      assert_not @user.valid? "#{a.inspect} shouldn't be valid."
    end
  end

  test "email addresses should be unique" do
    dupe = @user.dup
#    dupe.email = @user.email.upcase
    @user.save
    assert_not dupe.valid?
  end

  test "email addresses should be saved downcased" do
    mc_email = "ZUG@c.com"
    @user.email = mc_email
    @user.save
    assert_equal mc_email.downcase, @user.reload.email
  end

  test "passwords must have min length" do
    @user.password = @user.password_confirmation = "z" * 7
    assert_not @user.valid?
  end

  test "authenticated? should return false for user with nil digest" do
    assert_not @user.authenticated?('')
  end

end
