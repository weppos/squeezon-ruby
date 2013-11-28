require 'sinatra/base'
require 'squeezon'

module Squeezon
  class App < Sinatra::Base

    set :app_file, __FILE__

    configure :development do
      register Sinatra::Reloader
    end

    configure :production do
      require 'newrelic_rpm'
    end


    get "/" do
      "Hello from Squeezon!"
    end

    get "/api/feed/full/*" do
      feed = Squeezon::Feed.new(params[:splat].first)
      data = feed.to_squeezon

      json data, callback: params[:callback]
    end

    get "/api/feed/head/*" do
      feed = Squeezon::Feed.new(params[:splat].first)
      data = feed.head.to_squeezon

      json data, callback: params[:callback]
    end

    get "/api/feed/entries/*" do
      # GC.start
      feed = Squeezon::Feed.new(params[:splat].first)
      data = feed.entries.to_squeezon

      json data, callback: params[:callback]
      # json({ entries: [] }, callback: params[:callback])
    end


    def json(template, options = {}, locals = {})
      content = case template
      when Symbol
        raise ArgumentError, "symbol is reserved for template names"
      when String
        template
      else
        template.to_json
      end
      content = "#{options[:callback]}(#{content})" unless options[:callback].blank?

      content_type :json, charset: "utf-8"
      content
    end

  end
end
