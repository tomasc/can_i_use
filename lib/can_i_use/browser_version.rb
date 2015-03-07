class CanIUse
  class BrowserVersion

    attr_accessor :version_string
    attr_accessor :result_string

    # =====================================================================
      
    def initialize version_string, result_string
      @version_string = version_string
      @result_string = result_string
    end

    # ---------------------------------------------------------------------
      
    def <=> other
      Gem::Version.new(to_s.dup) <=> Gem::Version.new(other.to_s.dup)
    end

    def > other
      Gem::Version.new(to_s.dup) > Gem::Version.new(other.to_s.dup)
    end

    def >= other
      Gem::Version.new(to_s.dup) >= Gem::Version.new(other.to_s.dup)
    end

    def < other
      Gem::Version.new(to_s.dup) < Gem::Version.new(other.to_s.dup)
    end

    def <= other
      Gem::Version.new(to_s.dup) <= Gem::Version.new(other.to_s.dup)
    end

    def == other
      Gem::Version.new(to_s.dup) == Gem::Version.new(other.to_s.dup)
    end

    # ---------------------------------------------------------------------
      
    def to_s
      @version_string
    end

    def to_f
      @version_string.to_f
    end

    # ---------------------------------------------------------------------
      
    def supported?
      almost_supported? || fully_supported?
    end

    def almost_supported?
      @result_string == 'a'
    end

    def fully_supported?
      @result_string == 'y'
    end

  end
end