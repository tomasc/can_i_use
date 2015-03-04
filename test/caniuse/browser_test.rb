require 'test_helper'

module Caniuse
  describe Browser do

    subject { Caniuse::Browser.new("chrome", {"5.5"=>"n","6"=>"n","7"=>"n","8"=>"n","9"=>"y","10"=>"y","11"=>"y","TP"=>"y"}) }

    it 'returns an array of browsers' do
      subject.versions.map(&:class).uniq.must_equal [Caniuse::BrowserVersion]
    end

  end
end