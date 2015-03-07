require 'test_helper'

class CanIUse
  describe Browser do

    subject { CanIUse::Browser.new("chrome", {"5.5"=>"n","6"=>"n","7"=>"n","8"=>"a","9"=>"a","10"=>"y","11"=>"y"}) }

    describe '#versions' do
      it 'returns an array of versions' do
        subject.versions.must_be_kind_of Array
        subject.versions.map(&:class).uniq.first.must_equal CanIUse::BrowserVersion
      end
    end

    describe '#version' do
      it 'returns CanIUse::BrowserVersion' do
        subject.version('6').must_be_kind_of CanIUse::BrowserVersion
      end
    end

    # ---------------------------------------------------------------------
      
    describe '#supported_in_versions' do
      it 'returns all supported versions (both fully and partially)' do
        subject.supported_in_versions.map(&:to_s).must_equal %w(8 9 10 11)
      end
    end

    describe '#almost_supported_in_versions' do
      it 'returns all almost supported versions' do
        subject.almost_supported_in_versions.map(&:to_s).must_equal %w(8 9)
      end
    end

    describe '#fully_supported_in_versions' do
      it 'returns all fully supported versions' do
        subject.fully_supported_in_versions.map(&:to_s).must_equal %w(10 11)
      end
    end

    # ---------------------------------------------------------------------
    
    describe '#supported_from_version' do
      it 'returns first version with either partial or full support' do
        subject.supported_from_version.to_s.must_equal '8'
      end
    end

    describe '#almost_supported_from_version' do
      it 'returns first version with almost support' do
        subject.almost_supported_from_version.to_s.must_equal '8'
      end
    end

    describe '#fully_supported_from_version' do
      it 'returns first version with full support' do
        subject.fully_supported_from_version.to_s.must_equal '10'
      end
    end

    # ---------------------------------------------------------------------
    
    describe '#is?' do
      describe 'chrome' do
        let(:browser) { CanIUse::Browser.new("chrome", {}) }
        it { browser.is?('Chrome').must_equal true }
      end

      describe 'ie' do
        let(:browser) { CanIUse::Browser.new("ie", {}) }
        it { browser.is?('IE').must_equal true }
        it { browser.is?('MSIE').must_equal true }
      end

      describe 'safari' do
        let(:browser) { CanIUse::Browser.new("safari", {}) }
        it { browser.is?('Safari').must_equal true }
      end

      describe 'ios_saf' do
        let(:browser) { CanIUse::Browser.new("ios_saf", {}) }
        it { browser.is?('Safari Mobile').must_equal true }
        it { browser.is?('Mobile Safari').must_equal true }
      end

      describe 'firefox' do
        let(:browser) { CanIUse::Browser.new("firefox", {}) }
        it { browser.is?('Firefox').must_equal true }
      end

      describe 'opera' do
        let(:browser) { CanIUse::Browser.new("opera", {}) }
        it { browser.is?('Opera').must_equal true }
      end

      describe 'op_mini' do
        let(:browser) { CanIUse::Browser.new("op_mini", {}) }
        it { browser.is?('Opera Mini').must_equal true }
      end

      describe 'android' do
        let(:browser) { CanIUse::Browser.new("android", {}) }
        it { browser.is?('Android').must_equal true }
      end

      describe 'bb' do
        let(:browser) { CanIUse::Browser.new("bb", {}) }
        it { browser.is?('BlackBerry').must_equal true }
      end

      describe 'op_mob' do
        let(:browser) { CanIUse::Browser.new("op_mob", {}) }
        it { browser.is?('Opera Mobi').must_equal true }
      end

      describe 'and_chr' do
        let(:browser) { CanIUse::Browser.new("and_chr", {}) }
        it { browser.is?('Android Chrome').must_equal true }
      end

      describe 'and_ff' do
        let(:browser) { CanIUse::Browser.new("and_ff", {}) }
        it { browser.is?('Android Firefox').must_equal true }
      end

      describe 'ie_mob' do
        let(:browser) { CanIUse::Browser.new("ie_mob", {}) }
        it { browser.is?('IEMobile').must_equal true }
        it { browser.is?('MSIE Mobile').must_equal true }
        it { browser.is?('IE Mobile').must_equal true }
      end

      describe 'and_uc' do
        let(:browser) { CanIUse::Browser.new("and_uc", {}) }
        it { browser.is?('UCBrowser').must_equal true }
        it { browser.is?('Android UC').must_equal true }
        it { browser.is?('UC Browser').must_equal true }
        it { browser.is?('Android UC Browser').must_equal true }
      end
    end

  end
end