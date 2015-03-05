require 'user_agent_parser'

module CanIUse
  class UserAgent

    def initialize user_agent_string
      @user_agent_string = user_agent_string
      @user_agent = UserAgentParser.parse(user_agent_string)
    end

    def browser_key
      case 
      when @user_agent.family =~ /chrome\s+mobile/i then 'and_chr'
      when @user_agent.family =~ /firefox\s+mobile/i then 'and_ff'
      when @user_agent.family =~ /blackberry\s+webkit/i then 'bb'
      when @user_agent.family =~ /ie\s+mobile/i then 'ie_mob'
      when @user_agent.family =~ /mobile\s+safari/i then 'ios_saf'
      when @user_agent_string =~ /opera\s+mini/i then 'op_mini'
      when @user_agent.family =~ /opera\s+mobile/i then 'op_mob'
      when @user_agent.family =~ /uc\s+browser/i then 'and_uc'
      else @user_agent.family.downcase
      end
    end

  end
end