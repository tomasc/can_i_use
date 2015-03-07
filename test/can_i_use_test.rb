require 'test_helper'

describe CanIUse do

  describe '.updated_at' do
    it 'returns last update of the caniuse data embedded in this gem via submodule' do
      CanIUse.updated_at.must_be_kind_of Time
    end
  end

  # ---------------------------------------------------------------------
  
  # describe '#in?' do
  #   describe 'checking for "canvas" support in IE 6' do
  #     let(:user_agent_string) { 'Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)' }
  #     it 'returns false' do
  #       CanIUse.feature('canvas').in?(user_agent_string).must_equal false
  #     end
  #   end
  # end

  # describe '#in' do
  #   describe 'checking for "canvas" support in IE 6' do
  #     it 'returns "n"'
  #   end
  # end
end
