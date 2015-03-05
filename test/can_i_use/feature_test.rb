require 'test_helper'

class CanIUse
  describe Feature do

    describe 'WOFF' do
      let(:feature) { CanIUse::Feature.new('woff') }

      it 'returns Hash of browsers' do
        feature.browsers.must_be_kind_of Hash
        feature.browsers.values.map(&:class).uniq.first.must_equal CanIUse::Browser
      end
    end

  end
end