require 'test_helper'

class CanIUse
  describe Feature do
    describe 'WOFF' do
      let(:feature) { CanIUse::Feature.new('woff') }

      describe 'browser' do
        it 'returns Hash of browsers' do
          feature.browsers.must_be_kind_of Array
          feature.browsers.map(&:class).uniq.first.must_equal CanIUse::Browser
        end
      end

      describe '#for_browser' do
        it 'return CanIUse::Browser' do
          feature.for_browser('ie').must_be_kind_of CanIUse::Browser
          feature.for_browser('ie').name.must_equal 'ie'
        end
      end
    end
  end
end
