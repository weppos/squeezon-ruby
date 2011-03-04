require 'sinatra'
require 'squeezon'
require 'newrelic_rpm'

module Squeezon
  class App < Sinatra::Base

    dir = File.dirname(File.expand_path(__FILE__))

    set :public,    "#{dir}/public"
    set :static,    true


    get "/" do
      expires 1.day, :public, :must_revalidate

      "Hello from Squeezon!"
    end

    get "/api/feed/full/*" do
      expires 60, :public, :must_revalidate

      @url  = params[:splat].first
      @feed = Squeezon::Feed.new(@url)

      json @feed.to_squeezon, :callback => params[:callback]
    end

    get "/api/feed/head/*" do
      expires 60, :public, :must_revalidate

      @url  = params[:splat].first
      @feed = Squeezon::Feed.new(@url)

      json @feed.head.to_squeezon, :callback => params[:callback]
    end

    get "/api/feed/entries/*" do
      expires 60, :public, :must_revalidate

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
