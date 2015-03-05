require 'test_helper'

module CanIUse
  describe Browser do

    subject { CanIUse::Browser.new("chrome", {"5.5"=>"n","6"=>"n","7"=>"n","8"=>"n","9"=>"y","10"=>"y","11"=>"y","TP"=>"y"}) }

    it 'returns an array of browsers' do
      subject.versions.map(&:class).uniq.must_equal [CanIUse::BrowserVersion]
    end

  end
end