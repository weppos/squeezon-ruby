require 'sinatra/base'
require 'squeezon'

module Squeezon
  class App < Sinatra::Base

    set :app_file, __FILE__

    configure :development do
      register Sinatra::Reloader
    end


    get "/" do
      "Hello from Squeezon!"
    end

    get "/api/feed/full/*" do
      @url  = params[:splat].first
      @feed = Squeezon::Feed.new(@url)

      json @feed.to_squeezon, :callback => params[:callback]
    end

    get "/api/feed/head/*" do
      @url  = params[:splat].first
      @feed = Squeezon::Feed.new(@url)

      json @feed.head.to_squeezon, :callback => params[:callback]
    end

    get "/api/feed/entries/*" do
      @url  = params[:splat].first
      @feed = Squeezon::Feed.new(@url)

      json @feed.entries.to_squeezon, :callback => params[:callback]
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

      content_type :json, :charset => "utf-8"
      content
    end

  end
end
