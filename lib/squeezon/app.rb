require "sinatra"
require "squeezon"

module Squeezon
  class App < Sinatra::Base

    def json(template, options = {}, locals = {})
      content_type :json, :charset => "utf-8"
      case template
        when Symbol
          erb :"#{template}.json", options, locals
        when String
          template
        else
          template.to_json
      end
    end


    get "/" do
      "Hello from Squeezon!"
    end

    get "/api/feed/full/*" do
      @url  = params[:splat].first
      @feed = Squeezon::Feed.new(@url)

      json @feed.attributes_for_full
    end

    get "/api/feed/head/*" do
      @url  = params[:splat].first
      @feed = Squeezon::Feed.new(@url)

      json @feed.attributes_for_head
    end

    get "/api/feed/entries/*" do
      @url  = params[:splat].first
      @feed = Squeezon::Feed.new(@url)

      json @feed.attributes_for_entries
    end

  end
end
