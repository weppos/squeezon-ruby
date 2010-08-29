require "test_helper"
require "squeezon/app"

context "Squeezon::App" do

  def app
    Squeezon::App
  end

  test "GET /" do
    get "/"

    assert_equal 200, last_response.status
    assert_equal last_response.body, "Hello from Squeezon!"
  end


  test "GET /api/feed/full" do
    get "/api/feed/head/http://localhost:3001/feed/file.xml"

    assert_equal 200, last_response.status
    assert_match /\{(.*?)\}/, last_response.body
  end

  test "GET /api/feed/head" do
    get "/api/feed/head/http://localhost:3001/feed/file.xml"

    assert_equal 200, last_response.status
    assert_match /\{(.*?)\}/, last_response.body
  end

  test "GET /api/feed/entries" do
    get "/api/feed/head/http://localhost:3001/feed/file.xml"

    assert_equal 200, last_response.status
    assert_match /\{(.*?)\}/, last_response.body
  end


  mock_server(3001) do
    get "/feed/file.xml" do
      TESTCASES_PATH.join("feed", "file.xml").read 
    end
  end

end
