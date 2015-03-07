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
      @versions_hash.select{ |k, v| k =~ /[\d\.]/ }.inject([]) do |res, h| 
        res << BrowserVersion.new(*h)
      end
    end

    def version version_number
      versions.detect{ |v| v.to_s == version_number }
    end

    def supported_from_version support_type=:yes
      versions.detect{ |v| v.support_type == support_type }
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