require "test_helper"
require "squeezon/app"

context "Squeezon::App" do

  def app
    Squeezon::App
  end

  test "GET /" do
    get "/"

    assert last_response.ok?
    assert_equal last_response.body, "Hello from Squeezon!"
  end

end