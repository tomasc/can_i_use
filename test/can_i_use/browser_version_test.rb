require 'test_helper'

class CanIUse
  describe BrowserVersion do

    describe 'version' do
      it { CanIUse::BrowserVersion.new('5', 'y').to_s.must_equal '5' }
      it { CanIUse::BrowserVersion.new('5', 'y').to_f.must_equal 5 }
      it { CanIUse::BrowserVersion.new('5.1', 'y').to_s.must_equal '5.1' }
      it { CanIUse::BrowserVersion.new('5.1', 'y').to_f.must_equal 5.1 }
      it { CanIUse::BrowserVersion.new('9.5-9.6', 'y').to_s.must_equal '9.5-9.6' }
      it { CanIUse::BrowserVersion.new('9.5-9.6', 'y').to_f.must_equal 9.5 }
      it { CanIUse::BrowserVersion.new('4.4.3', 'y').to_s.must_equal '4.4.3' }
      it { CanIUse::BrowserVersion.new('4.4.3', 'y').to_f.must_equal 4.4 }
      it { CanIUse::BrowserVersion.new('4.4.3-4.4.4', 'y').to_s.must_equal '4.4.3-4.4.4' }
      it { CanIUse::BrowserVersion.new('4.4.3-4.4.4', 'y').to_f.must_equal 4.4 }
    end

    describe 'supported?' do
      it { CanIUse::BrowserVersion.new('5', 'a').supported?.must_equal true }
      it { CanIUse::BrowserVersion.new('5', 'n').supported?.must_equal false }
      it { CanIUse::BrowserVersion.new('5', 'y').supported?.must_equal true }
    end

    describe 'almost_supported?' do
      it { CanIUse::BrowserVersion.new('5', 'a').almost_supported?.must_equal true }
      it { CanIUse::BrowserVersion.new('5', 'n').almost_supported?.must_equal false }
      it { CanIUse::BrowserVersion.new('5', 'y').almost_supported?.must_equal false }
    end

    describe 'fully_supported?' do
      it { CanIUse::BrowserVersion.new('5', 'a').fully_supported?.must_equal false }
      it { CanIUse::BrowserVersion.new('5', 'n').fully_supported?.must_equal false }
      it { CanIUse::BrowserVersion.new('5', 'y').fully_supported?.must_equal true }
    end

    describe 'sorting' do
      let(:versions) { 
        [
          CanIUse::BrowserVersion.new('1', 'n'),
          CanIUse::BrowserVersion.new('1.1', 'n'),
          CanIUse::BrowserVersion.new('1.0.5', 'n'),
          CanIUse::BrowserVersion.new('1.10', 'n'),
          CanIUse::BrowserVersion.new('10', 'n'),
          CanIUse::BrowserVersion.new('6.5.4', 'n'),
          CanIUse::BrowserVersion.new('3.1', 'n')
        ]
      }
      it 'sorts the versions' do
        versions.sort.map(&:to_s).must_equal %w(1 1.0.5 1.1 1.10 3.1 6.5.4 10)
      end
    end

    describe 'comparison' do
      let(:v1) { CanIUse::BrowserVersion.new('1.10', 'n') }
      let(:v2) { CanIUse::BrowserVersion.new('5.0.4', 'n') }

      it 'compares them' do
        (v1 > v2).must_equal false
        (v1 >= v2).must_equal false
        (v1 < v2).must_equal true
        (v1 <= v2).must_equal true
        (v1 == v2).must_equal false
      end
    end

  end
end
