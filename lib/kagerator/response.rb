require 'json'
require 'symboltable'

module Kagerator
  class Response

    def initialize(response)
      @response = response
    end

    def from_json
      SymbolTable.new(::JSON.parse(@response))
    end
  end
end