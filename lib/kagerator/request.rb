require 'rest-client'
require File.dirname(__FILE__)+'/response'

module Kagerator
  include RestClient
  API_URL = 'https://api.kag2d.com/'

  class Request
    def self.execute(args, &block)
      new(args).execute(&block)
    end

    def initialize args
      @method = args[:method] or raise ArgumentError, "must pass :method"
      @headers = args[:headers] || {}
      if args[:url]
        @url = args[:url]
      else
        raise ArgumentError, "must pass :url"
      end
      @args = args
    end

    def execute &block
      response = ::RestClient.send(@method,API_URL+@url)
      if block_given?
        block.call(response, self, & block)
      end
      Kagerator::Response.new(response)
    end
  end
end