require_relative 'version'

class CanIUse
  class Browser

    attr_accessor :name
    attr_accessor :versions_hash

    # =====================================================================
      
    def initialize name, versions_hash
      @name = name
      @versions_hash = versions_hash
    end

    # ---------------------------------------------------------------------
      
    def versions
      @versions_hash.inject([]) { |res, h| res << BrowserVersion.new(*h) unless h[1] =~ /TP/i }.sort
    end

    def version version_number
      versions.detect{ |v| v.to_s == version_number }
    end

    # ---------------------------------------------------------------------
      
    def supported_in_versions
      versions.select(&:supported?)
    end

    def fully_supported_in_versions
      versions.select(&:fully_supported?)
    end

    def almost_supported_in_versions
      versions.select(&:almost_supported?)
    end
    
    # ---------------------------------------------------------------------
    
    def supported_from_version
      supported_in_versions.sort.first
    end

    def almost_supported_from_version
      almost_supported_in_versions.sort.first
    end

    def fully_supported_from_version
      fully_supported_in_versions.sort.first
    end

    # ---------------------------------------------------------------------
    
    def is? str
      !!case name
      when 'ios_saf' then str =~ /mobile/i && str =~ /safari/i
      when 'op_mini' then str =~ /opera/i && str =~ /mini/i
      when 'bb' then str =~ /BlackBerry/i
      when 'op_mob' then str =~ /Opera/i && str =~ /Mobi/i
      when 'and_chr' then str =~ /Android/i && str =~ /Chrome/i
      when 'and_ff' then str =~ /Android/i && str =~ /Firefox/i
      when 'ie_mob' then str =~ /IE/i && str =~ /Mobile/i
      when 'and_uc' then str =~ /(Android)?UC\s?(Browser)?/i
      else str =~ /#{name}/i
      end
    end

  end
end