require 'json'
require 'user_agent_parser'

require_relative 'browser'

class CanIUse
  class Feature

    def initialize name
      @name = name
    end

    # ---------------------------------------------------------------------
      
    def browsers
      return [] unless feature_data
      feature_data.fetch('stats', {}).inject([]) { |res, h| res << Browser.new(*h) }
    end

    def in_browser name
      browsers.detect{ |b| b.is?(name) }
    end

    # ---------------------------------------------------------------------
      
    def supported_in? user_agent_string
      test_support user_agent_string
    end

    def almost_supported_in? user_agent_string
      test_support user_agent_string, :almost
    end

    def fully_supported_in? user_agent_string
      test_support user_agent_string, :full
    end

    private # =============================================================
      
    def feature_data
      @feature_data ||= CANIUSE_DATA['data'][@name]
    end

    def test_support user_agent_string, support_type=nil
      user_agent = UserAgentParser.parse(user_agent_string)
      browser = in_browser(user_agent.family)
      
      supported_version = case support_type
      when :full then browser.fully_supported_from_version
      when :almost then browser.almost_supported_from_version
      else browser.supported_from_version
      end

      Gem::Version.new(user_agent.version.to_s.dup) >= Gem::Version.new(supported_version.to_s.dup)
    end

  end
end