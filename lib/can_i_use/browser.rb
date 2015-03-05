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
      @versions ||= {}
      @versions_hash.each do |version, result| 
        @versions[version] = CanIUse::BrowserVersion.new(version, result)
      end
      @versions
    end

    def version version_number
      versions[version_number.to_s].to_boolean
    end
    
  end
end