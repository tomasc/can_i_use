require 'test_helper'

module Caniuse
  describe Feature do

    describe 'WOFF' do
      let(:feature) { Caniuse::Feature.new('woff') }

      it 'returns an array of browsers' do
        feature.browsers.map(&:class).uniq.must_equal [Caniuse::Browser]
      end
    end

  end
end