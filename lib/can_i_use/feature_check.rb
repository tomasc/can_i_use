module CanIUse
  class FeatureCheck

    def self.feature feature_name
      new(feature_name)
    end

    # =====================================================================
      
    def initialize feature_name
      @feature = Feature.new(feature_name)
    end

    def supported_by? user_agent_string, options={}
      as = options.fetch(:as, :boolean)
    end

    # def min_version
      
    # end

  end
end