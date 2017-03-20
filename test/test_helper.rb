ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def valid_user
    User.new({ email: "user@mail.com",
               password: "Password 1"
            })
  end

  def valid_link
    Link.new({ url: "https://reverb.com/",
               title: "test title"
            })
  end

end

class ActionController::TestCase
  def json_response
    JSON.parse response.body
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def teardown
    reset_session!
  end

end
