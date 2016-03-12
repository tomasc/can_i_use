require 'test_helper'

describe CanIUse::UserAgent do
  describe 'Safari 8' do
    let(:safari_8_user_agent_string) { 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/600.5.6 (KHTML, like Gecko) Version/8.0.5 Safari/600.5.6' }

    it 'supports "canvas"' do
      CanIUse::UserAgent.new(safari_8_user_agent_string).supports?('canvas').must_equal true
    end
  end

  describe 'IE 6' do
    let(:ie_6_user_agent_string) { 'Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)' }

    it 'does not support "canvas"' do
      CanIUse::UserAgent.new(ie_6_user_agent_string).supports?('canvas').must_equal false
    end
  end

  describe 'not supported at all' do
    let(:ie_10) { 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)' }

    it 'does not support "woff2"' do
      CanIUse::UserAgent.new(ie_10).supports?('woff2').must_equal false
    end
  end

  describe 'unknown or invalid user agent' do
    let(:unknown) { 'Unknown User Agent' }

    it 'returns false' do
      CanIUse::UserAgent.new(unknown).supports?('canvas').must_equal false
      CanIUse::UserAgent.new(unknown).supports?('woff2').must_equal false
    end
  end
end
