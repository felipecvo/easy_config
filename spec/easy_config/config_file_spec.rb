require 'spec_helper'

describe EasyConfig::ConfigFile do
  before { EasyConfig::PathResolver.config_paths << './spec/fixtures' }
  after { EasyConfig::PathResolver.clear! }

  context "all files" do
    subject { EasyConfig::ConfigFile.all }
    it { should_not be_nil }
    its(:size) { should eq 3 }
  end

  context "specific file" do
    subject { EasyConfig::ConfigFile.all.find { |c| c.name == :facebook } }
    it { should_not be_nil }
    its(:name) { should eq :facebook }
    its(:configuration) { should_not be_nil }
    its(:configuration) { should be_a EasyConfig::Configuration }
    its('configuration.app_id') { should eq 1234 }
    its('configuration.permissions.roles') { should eq 'master' }
  end

  context "per environment file" do
    subject { EasyConfig::ConfigFile.all.find { |c| c.name == :redis } }
    it { should_not be_nil }
    its(:name) { should eq :redis }
    its(:configuration) { should_not be_nil }
    its(:configuration) { should be_a EasyConfig::Configuration }
    its('configuration.host') { should eq 'localhost' }
    its('configuration.port') { should eq 4567 }
  end

  context "ERB support" do
    before do
      ENV['redis_password'] = 'sTrOnGpAssWorD'
      EasyConfig.reset!
    end

    subject { EasyConfig::ConfigFile.all.find { |c| c.name == :redis } }
    its('configuration.password') { should eq 'sTrOnGpAssWorD' }
  end
end
