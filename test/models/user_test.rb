require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def valid_user
    User.new({ email: "user@mail.com",
               password: "Password 1"
      })
  end

  test "user is valid" do
    assert valid_user.valid?
  end

  test "it is invalid without an email address" do
    user = valid_user
    user.email = nil

    refute user.valid?
  end

  test "it is invalid without password" do
    user = valid_user
    user.password = nil

    refute user.valid?
  end

  test "it must have a unique email address" do
    valid_user.save
    same_user = User.new({email: "user@mail.com",
                          password: "DIFFERENT" })
    refute same_user.valid?
  end

end
