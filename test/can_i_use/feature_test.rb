require 'test_helper'

module CanIUse
  describe Feature do

    describe 'WOFF' do
      let(:feature) { CanIUse::Feature.new('woff') }

      it 'returns an array of browsers' do
        feature.browsers.map(&:class).uniq.must_equal [CanIUse::Browser]
      end
    end

  end
end