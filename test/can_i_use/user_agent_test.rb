require 'test_helper'

class CanIUse
  describe UserAgent do

    subject { CanIUse::UserAgent.new(user_agent_string) }

    # ---------------------------------------------------------------------
      
    describe '#browser' do
      describe 'chrome' do
        let(:user_agent_string) { 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36' }
        it { subject.browser.must_equal 'chrome' }
      end

      describe 'ie' do
        let(:user_agent_string) { 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;)' }
        it { subject.browser.must_equal 'ie' }
      end

      describe 'safari' do
        let(:user_agent_string) { 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A' }
        it { subject.browser.must_equal 'safari' }
      end

      describe 'ios_saf' do
        let(:user_agent_string) { 'Mozilla/5.0 (iPad; CPU OS 5_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko ) Version/5.1 Mobile/9B176 Safari/7534.48.3' }
        it { subject.browser.must_equal 'ios_saf' }
      end

      describe 'firefox' do
        let(:user_agent_string) { 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0' }
        it { subject.browser.must_equal 'firefox' }
      end

      describe 'opera' do
        let(:user_agent_string) { 'Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16' }
        it { subject.browser.must_equal 'opera' }
      end

      describe 'op_mini' do
        let(:user_agent_string) { 'Opera/9.80 (J2ME/MIDP; Opera Mini/9.80 (S60; SymbOS; Opera Mobi/23.348; U; en) Presto/2.5.25 Version/10.54' }
        it { subject.browser.must_equal 'op_mini' }
      end

      describe 'android' do
        let(:user_agent_string) { 'Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30' }
        it { subject.browser.must_equal 'android' }
      end

      describe 'bb' do
        let(:user_agent_string) { 'Mozilla/5.0 (BlackBerry; U; BlackBerry 9900; en) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.1.0.346 Mobile Safari/534.11+' }
        it { subject.browser.must_equal 'bb' }
      end

      describe 'op_mob' do
        let(:user_agent_string) { 'Opera/12.02 (Android 4.1; Linux; Opera Mobi/ADR-1111101157; U; en-US) Presto/2.9.201 Version/12.02' }
        it { subject.browser.must_equal 'op_mob' }
      end

      describe 'and_chr' do
        let(:user_agent_string) { 'Mozilla/5.0 (Linux; Android 4.0.4; Galaxy Nexus Build/IMM76B) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.133 Mobile Safari/535.19' }
        it { subject.browser.must_equal 'and_chr' }
      end

      describe 'and_ff' do
        let(:user_agent_string) { 'Mozilla/5.0 (Android; Mobile; rv:26.0) Gecko/26.0 Firefox/26.0' }
        it { subject.browser.must_equal 'and_ff' }
      end

      describe 'ie_mob' do
        let(:user_agent_string) { 'Mozilla/5.0 (compatible; MSIE 9.0; Windows Phone OS 7.5; Trident/5.0; IEMobile/9.0)' }
        it { subject.browser.must_equal 'ie_mob' }
      end

      describe 'and_uc' do
        let(:user_agent_string) { 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; SM-T210R Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30 UCBrowser/2.3.2.300' }
        it { subject.browser.must_equal 'and_uc' }
      end
    end

    # ---------------------------------------------------------------------
    
    describe '#version' do
      # TODO:
    end

  end
end