require "can_i_use/version"

require 'can_i_use/browser'
require 'can_i_use/browser_version'
require 'can_i_use/feature'
require 'can_i_use/user_agent'

class CanIUse

  CANIUSE_DATA = JSON.parse(
    File.read(
      File.join(
        [ File.dirname(__FILE__), '..', 'vendor/caniuse/data.json' ]
      )
    )
  )

  # =====================================================================
  
  def self.updated_at
    Time.at(CANIUSE_DATA['updated'].to_i).utc
  end

end
