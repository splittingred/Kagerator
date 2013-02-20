require 'rubygems'
require 'bundler/setup'
require 'json'
require 'symboltable'

RSpec.configure do |config|
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end

module KageratorTest
  attr_accessor :_config

  ##
  # Returns the config file parsed into a SymbolTable
  #
  # @return [SymbolTable]
  #
  def self.config
    SymbolTable.new
  end

  ##
  # Returns the config hash
  #
  # @return [SymbolTable]
  #
  def config
    unless self._config
      self._config = KageratorTest.config
    end
    self._config
  end
end