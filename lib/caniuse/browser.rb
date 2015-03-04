require_relative 'version'

module Caniuse
  class Browser

    attr_accessor :name
    attr_accessor :versions_hash

    def initialize name, versions_hash
      @name = name
      @versions_hash = versions_hash
    end

    def versions
      @versions_hash.map{ |version, result| Caniuse::BrowserVersion.new(version, result) }
    end
    
  end
end