require 'test_helper'

class CanIUse
  describe Browser do

    subject { CanIUse::Browser.new("chrome", {"5.5"=>"n","6"=>"n","7"=>"n","8"=>"n","9"=>"y","10"=>"y","11"=>"y","TP"=>"y"}) }

    describe '#versions' do
      it 'returns an array of versions' do
        subject.versions.must_be_kind_of Hash
        subject.versions.values.map(&:class).uniq.first.must_equal CanIUse::BrowserVersion
      end
    end

    describe '#version' do
      it 'returns false for 6' do
        subject.version('6').must_equal false
        subject.version(6).must_equal false
      end

      it 'returns true for 9' do
        subject.version('9').must_equal true
        subject.version(9).must_equal true
      end
    end

  end
end