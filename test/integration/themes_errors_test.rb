require "test_helper"

class ThemesErrorsTest < ActionDispatch::IntegrationTest
  setup do
    @t = Theme.create(name: 'zgeg')
  end

  test "querying a non-existing theme returns a error" do
    post '/themes/999'
    assert_response :not_found # Ensures the response status is 404

    response = JSON.parse(@response.body)
    assert_equal "error", response["status"]
    assert_equal "Theme not found", response["message"]
  end

  test "querying without players returns an error" do
    post "/themes/#{@t.id}"
    assert_response :unprocessable_entity

    response = JSON.parse(@response.body)
    assert_equal "error", response["status"]
    assert_equal "Players must be provided.", response["message"]
  end

  test "unicity of players names is enforced" do
    post "/themes/#{@t.id}", params: {'players': ['a', 'a', 'b']}
    assert_response :unprocessable_entity

    response = JSON.parse(@response.body)
    assert_equal "error", response["status"]
    assert_equal "Players must be unique.", response["message"]
  end

  test "quantity of players is at least 3" do
    post "/themes/#{@t.id}", params: {'players': ['a', 'b']}
    assert_response :unprocessable_entity

    response = JSON.parse(@response.body)
    assert_equal "error", response["status"]
    assert_equal "Players must be at least 3 to play.", response["message"]
  end
end