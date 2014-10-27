require 'spec_helper'

describe EasyConfig do
  before do
    EasyConfig.reset!
    EasyConfig.append_config_path File.expand_path('./spec/fixtures/config')
  end

  context "mising methods" do
    it 'should treat it' do
      lambda { EasyConfig.facebook }.should_not raise_error
    end
  end

  context "access per env config file" do
    subject { EasyConfig.redis }
    it { should be_a EasyConfig::Configuration }
    its(:host) { should eq 'localhost' }
    its(:port) { should eq 4567 }
  end

  context "access simle config file" do
    subject { EasyConfig.github }
    it { should be_a EasyConfig::Configuration }
    its(:user) { should eq 'felipecvo' }
  end

  context "inexistent files" do
    it 'should throw exception' do
      lambda { EasyConfig.no_exist }.should raise_error(EasyConfig::ConfigurationNotFound)
    end
  end

  context "default environment" do
    subject { EasyConfig.environment }
    it { should eq "development" }
  end

  context "set custom environment" do
    before do
      @env = EasyConfig.environment
      EasyConfig.environment = "test"
    end
    after { EasyConfig.environment = @env }
    subject { EasyConfig.environment }
    it { should eq "test" }
  end
end
