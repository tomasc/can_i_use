require 'test_helper'

describe CanIUse do

  describe '.updated_at' do
    it 'returns last update of the caniuse data embedded in this gem via submodule' do
      CanIUse.updated_at.must_be_kind_of Time
    end
  end

end
