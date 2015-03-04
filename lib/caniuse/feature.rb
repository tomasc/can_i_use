require 'json'

require_relative 'browser'

module Caniuse
  class Feature

    FEATURE_FILES_DIR = 'vendor/caniuse/features-json'

    # =====================================================================
      
    def initialize name
      @name = name
    end

    def browsers
      return [] unless feature_data
      @browsers ||= feature_data.fetch('stats', {}).map do |browser_name, versions_hash|
        Caniuse::Browser.new(browser_name, versions_hash)
      end
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