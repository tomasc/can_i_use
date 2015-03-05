require 'json'

require_relative 'browser'
require_relative 'user_agent'

class CanIUse
  class Feature

    FEATURE_FILES_DIR = 'vendor/caniuse/features-json'

    # =====================================================================
      
    def initialize name
      @name = name
    end

    def browsers
      return [] unless feature_data
      @browsers ||= {}
      feature_data.fetch('stats', {}).each do |browser_name, versions_hash|
        @browsers[browser_name] = Browser.new(browser_name, versions_hash)
      end
      @browsers
    end

    def in? user_agent_string
      user_agent = UserAgent.new(user_agent_string)
      browser = browsers[user_agent.browser]
      browser.version(user_agent.version.to_s)
    end

    private # =============================================================

    def feature_data
      @feature_data ||= JSON.parse(feature_file)
    end

    def feature_file
      File.read(
        File.join(
          [ File.dirname(__FILE__), '..', '..', FEATURE_FILES_DIR, "#{@name}.json" ]
        )
      )
    end

  end
end