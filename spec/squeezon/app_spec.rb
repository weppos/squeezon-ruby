require "spec_helper"
require "squeezon/app"

describe Squeezon::App do

  def app
    Squeezon::App
  end


  describe "GET /" do

    it "should respond with 200" do
      get "/"
      last_response.status.should == 200
      last_response.body.should == "Hello from Squeezon!"
    end

  end

  describe "GET /api/feed/full" do

    it "should respond with 200" do
      get "/api/feed/head/http://localhost:11988/feed/file.xml"
      last_response.status.should == 200
      last_response.body.should match /\{(.*?)\}/
    end

  end

  describe "GET /api/feed/head" do

    it "should respond with 200" do
      get "/api/feed/head/http://localhost:11988/feed/file.xml"
      last_response.status.should == 200
      last_response.body.should match /\{(.*?)\}/
    end

  end

  describe "GET /api/feed/entries" do

    it "should respond with 200" do
      get "/api/feed/head/http://localhost:11988/feed/file.xml"
      last_response.status.should == 200
      last_response.body.should match /\{(.*?)\}/
    end

  end


  Mimic.mimic do
    get "/feed/file.xml" do
      TESTCASES_PATH.join("feed", "file.xml").read 
    end
  end

end
