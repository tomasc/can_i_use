require 'json'
require_relative 'browser'

class CanIUse
  class Feature
    def initialize(name)
      @name = name
    end

    # ---------------------------------------------------------------------

    def browsers
      return [] unless feature_data
      feature_data.fetch('stats', {}).inject([]) { |res, h| res << Browser.new(*h) }
    end

    def for_browser(name)
      browsers.detect { |b| b.is?(name) }
    end

    private # =============================================================

    def feature_data
      @feature_data ||= CANIUSE_DATA['data'][@name]
    end
  end
end
