require 'user_agent_parser'

class CanIUse
  class UserAgent
    attr_accessor :user_agent_string

    # =====================================================================

    def initialize(user_agent_string)
      @user_agent_string = user_agent_string
    end

    # ---------------------------------------------------------------------

    def supports?(feature_name, support_type = :yes)
      feature = Feature.new(feature_name)
      browser = feature.for_browser(user_agent.family)
      return false unless supported_from_version = browser.supported_from_version(support_type)
      Gem::Version.new(user_agent.version.to_s.dup) >= Gem::Version.new(supported_from_version.to_s.dup)
    end

    private # =============================================================

    def user_agent
      UserAgentParser.parse(@user_agent_string)
    end
  end
end
