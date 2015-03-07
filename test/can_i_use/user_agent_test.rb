require 'test_helper'

class CanIUse
  describe UserAgent do

    let(:safari_8_user_agent_string) { 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/600.5.6 (KHTML, like Gecko) Version/8.0.5 Safari/600.5.6' }
    let(:ie_6_user_agent_string) { 'Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)' }

    # ---------------------------------------------------------------------
    
    describe 'Safari 8' do
      it 'supports "canvas"' do
        CanIUse::UserAgent.new(safari_8_user_agent_string).supports?('canvas').must_equal true
      end
    end

    describe 'IE 6' do
      it 'does not support "canvas"' do
        CanIUse::UserAgent.new(ie_6_user_agent_string).supports?('canvas').must_equal false
      end
    end

  end
end