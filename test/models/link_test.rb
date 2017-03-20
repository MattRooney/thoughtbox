require 'test_helper'

class LinkTest < ActiveSupport::TestCase

  test "link is valid" do
    assert valid_link.valid?
  end

  test "it is invalid without an url address" do
    link = valid_link
    link.url = nil

    refute link.valid?
  end

  test "it is invalid without password" do
    link = valid_link
    link.title = nil

    refute link.valid?
  end

end
