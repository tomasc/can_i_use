require "can_i_use/version"

require 'can_i_use/browser'
require 'can_i_use/browser_version'
require 'can_i_use/feature'
require 'can_i_use/user_agent'

class CanIUse

  def self.feature name
    Feature.new(name)
  end

end