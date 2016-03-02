require 'test_helper'

class CanIUse
  describe BrowserVersion do
    describe 'support' do
      it { CanIUse::BrowserVersion.new('0', 'y').support_type.must_equal :yes }
      it { CanIUse::BrowserVersion.new('0', 'a').support_type.must_equal :almost }
      it { CanIUse::BrowserVersion.new('0', 'n').support_type.must_equal :no }
      it { CanIUse::BrowserVersion.new('0', 'p').support_type.must_equal :polyfill }
      it { CanIUse::BrowserVersion.new('0', 'u').support_type.must_equal :unknown }
      it { CanIUse::BrowserVersion.new('0', 'x').support_type.must_equal :prefix }
      it { CanIUse::BrowserVersion.new('0', 'd').support_type.must_equal :disabled }
    end

    describe 'sorting' do
      let(:versions) do
        [
          CanIUse::BrowserVersion.new('1', 'n'),
          CanIUse::BrowserVersion.new('1.1', 'n'),
          CanIUse::BrowserVersion.new('1.0.5', 'n'),
          CanIUse::BrowserVersion.new('1.10', 'n'),
          CanIUse::BrowserVersion.new('10', 'n'),
          CanIUse::BrowserVersion.new('6.5.4', 'n'),
          CanIUse::BrowserVersion.new('3.1', 'n')
        ]
      end
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
