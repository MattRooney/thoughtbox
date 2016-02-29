require 'test_helper'

class UserLogsInTest < ActionDispatch::IntegrationTest
  test "visitor can see login link" do
    visit root_path

    within(".welcome") do
      assert page.has_content?("Log In or Sign Up")
    end
  end
end
