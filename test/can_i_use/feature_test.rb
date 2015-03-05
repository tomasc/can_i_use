require 'test_helper'

class CanIUse
  describe Feature do

    describe 'WOFF' do
      let(:feature) { CanIUse::Feature.new('woff') }

      describe 'browser' do
        it 'returns Hash of browsers' do
          feature.browsers.must_be_kind_of Hash
          feature.browsers.values.map(&:class).uniq.first.must_equal CanIUse::Browser
        end
      end

      describe '#in?' do
        describe 'Safari 7.0.3' do
          let(:user_agent_string) { 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A' }
          it 'returns true' do
            feature.in?(user_agent_string).must_equal true
          end
        end
      end
    end

  end
end