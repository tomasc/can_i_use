require_relative 'version'

class CanIUse
  class Browser

    attr_accessor :name
    attr_accessor :versions_hash

    def initialize name, versions_hash
      @name = name
      @versions_hash = versions_hash
    end

    def versions
      @versions_hash.map{ |version, result| CanIUse::BrowserVersion.new(version, result) }
    end

    def supported_in_version? version_number
      
    end
    
  end
end