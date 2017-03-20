require 'test_helper'

class Api::V1::LinksControllerTest < ActionController::TestCase
  test "controller responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test '#index returns an array of records' do
    get :index, format: :json
    assert_kind_of Array, json_response
  end

  test '#index returns the correct number of links' do
    get :index, format: :json

    assert_equal Link.count, json_response.count
  end

  test '#index contains links with the correct properties' do
    get :index, format: :json

    json_response.each do |link|
      assert link["title"]
      assert link["url"]
      refute link["read"]
    end
  end

  test "#create adds an additional link to to the database" do
    assert_difference 'Link.count', 1 do
      link = { title: "New Link", url: "https://Something.com" }

      post :create, link: link, format: :json
    end
  end

end
