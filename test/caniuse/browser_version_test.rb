require 'test_helper'

module Caniuse
  describe BrowserVersion do

    describe 'version' do
      it { Caniuse::BrowserVersion.new('5', 'y').to_s.must_equal '5' }
      it { Caniuse::BrowserVersion.new('5', 'y').to_f.must_equal 5 }
      it { Caniuse::BrowserVersion.new('5.1', 'y').to_s.must_equal '5.1' }
      it { Caniuse::BrowserVersion.new('5.1', 'y').to_f.must_equal 5.1 }
      it { Caniuse::BrowserVersion.new('9.5-9.6', 'y').to_s.must_equal '9.5-9.6' }
      it { Caniuse::BrowserVersion.new('9.5-9.6', 'y').to_f.must_equal 9.5 }
      it { Caniuse::BrowserVersion.new('4.4.3', 'y').to_s.must_equal '4.4.3' }
      it { Caniuse::BrowserVersion.new('4.4.3', 'y').to_f.must_equal 4.4 }
      it { Caniuse::BrowserVersion.new('4.4.3-4.4.4', 'y').to_s.must_equal '4.4.3-4.4.4' }
      it { Caniuse::BrowserVersion.new('4.4.3-4.4.4', 'y').to_f.must_equal 4.4 }
    end

    describe 'to_boolean' do
      it { Caniuse::BrowserVersion.new('5', 'y').to_boolean.must_equal true }
      it { Caniuse::BrowserVersion.new('5', 'n').to_boolean.must_equal false }
    end

  end
end
