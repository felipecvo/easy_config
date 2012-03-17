require 'spec_helper'

describe EasyConfig::Configuration do
  subject { EasyConfig::Configuration.new({ :blue => 255 }) }
  it { should_not be_nil }
  its(:blue) { should eq 255 }
  its(:red) { should be_nil }
end
