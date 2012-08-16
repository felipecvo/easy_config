require 'spec_helper'

describe EasyConfig::Env do
  before { EasyConfig::Env.instance_variable_set('@env', nil) }

  context :current do

    context "Rails.env" do
      before { module ::Rails; def self.env; "production"; end; end }
      after { Object.send(:remove_const, :Rails) }
      subject { EasyConfig::Env.current }
      it { should eq "production" }
    end

    context "Rack env" do
      before { ENV['RACK_ENV'] = "test" }
      after { ENV['RACK_ENV'] = nil }
      subject { EasyConfig::Env.current }
      it { should eq "test" }
    end

    context "default environment" do
      subject { EasyConfig::Env.current }
      it { should eq "development" }
    end

    context "custom environment" do
      before { EasyConfig::Env.set('test') }
      subject { EasyConfig::Env.current }
      it { should eq 'test' }
    end
  end

  context :has_environment? do
    context "with environments" do
      subject { EasyConfig::Env.has_environment?({ 'development' => { 'key' => 'value' } }) }
      it { should be_true }
    end

    context "without environments" do
      subject { EasyConfig::Env.has_environment?({ 'key' => 'value' }) }
      it { should be_false }
    end
  end
end
