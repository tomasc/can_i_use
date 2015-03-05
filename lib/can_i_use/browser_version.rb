module CanIUse
  class BrowserVersion

    attr_accessor :version_string
    attr_accessor :result_string

    def initialize version_string, result_string
      @version_string = version_string
      @result_string = result_string
    end

    def to_s
      @version_string
    end

    def to_f
      @version_string.to_f
    end

    def to_boolean
      @result_string == 'y'
    end

  end
end