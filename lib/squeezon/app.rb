require "sinatra"
require "squeezon"

module Squeezon
  class App < Sinatra::Base

    get "/" do
      "Hello from Squeezon!"
    end

  end
end
