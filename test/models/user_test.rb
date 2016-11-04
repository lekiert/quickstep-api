require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Adam",
                     last_name: "Kowalski",
                     email: "adam@kowalski.com",
                     password: "secret1",
                     password_confirmation: "secret1",
                     role: "USER",
                     status: 1)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should have a first name" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  # first name

  test "first name must have at least 3 characters" do
    @user.first_name = "xy"
    assert_not @user.valid?
  end

  test "first name length must not exceed 30 characters" do
    @user.first_name = "x" * 31
    assert_not @user.valid?
  end

  # last name

  test "should have a last name" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test "last name must have at least 3 characters" do
    @user.last_name = "xy"
    assert_not @user.valid?
  end

  test "last name length must not exceed 50 characters" do
    @user.last_name = "x" * 51
    assert_not @user.valid?
  end

  # email

  test "should have an email" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email should not be too short" do
    @user.email = "a@b.c"
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicated_user = @user.dup
    duplicated_user.email = @user.email.upcase
    @user.save
    assert_not duplicated_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  # password

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
