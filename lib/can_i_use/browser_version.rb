class CanIUse
  class BrowserVersion
    attr_accessor :version_string
    attr_accessor :support_string

    # =====================================================================

    def initialize(version_string, support_string)
      @version_string = version_string
      @support_string = support_string
    end

    # ---------------------------------------------------------------------

    def <=>(other)
      Gem::Version.new(to_s.dup) <=> Gem::Version.new(other.to_s.dup)
    end

    def >(other)
      Gem::Version.new(to_s.dup) > Gem::Version.new(other.to_s.dup)
    end

    def >=(other)
      Gem::Version.new(to_s.dup) >= Gem::Version.new(other.to_s.dup)
    end

    def <(other)
      Gem::Version.new(to_s.dup) < Gem::Version.new(other.to_s.dup)
    end

    def <=(other)
      Gem::Version.new(to_s.dup) <= Gem::Version.new(other.to_s.dup)
    end

    def ==(other)
      Gem::Version.new(to_s.dup) == Gem::Version.new(other.to_s.dup)
    end

    # ---------------------------------------------------------------------

    def to_s
      @version_string
    end

    # ---------------------------------------------------------------------

    # y - (Y)es, supported by default
    # a - (A)lmost supported (aka Partial support)
    # n - (N)o support, or disabled by default
    # p - No support, but has (P)olyfill
    # u - Support (u)nknown
    # x - Requires prefi(x) to work
    # d - (D)isabled by default (need to enable flag or something)
    # #n - Where n is a number, starting with 1, corresponds to the notes_by_num note. For example: "42":"y #1" means version 42 is supported by default and see note 1.

    # TODO: append note
    def support_type
      case
      when support_string =~ /y/i then :yes
      when support_string =~ /a/i then :almost
      when support_string =~ /n/i then :no
      when support_string =~ /p/i then :polyfill
      when support_string =~ /u/i then :unknown
      when support_string =~ /x/i then :prefix
      when support_string =~ /d/i then :disabled
      end
    end
  end
end
