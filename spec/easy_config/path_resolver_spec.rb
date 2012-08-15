require 'spec_helper'

describe EasyConfig::PathResolver do
  context "#config_path" do
    context "resolve Rails config dir" do
      before { module ::Rails; def self.root; "./"; end; end }
      after { Object.send(:remove_const, :Rails) }
      subject { EasyConfig::PathResolver.config_path }
      it { should eq "./config/*.yml" }
    end

    context "resolve Sinatra config dir" do
      before { module ::Sinatra; module Application; def self.root; "/sinatra/"; end; end; end }
      after { Object.send(:remove_const, :Sinatra) }
      subject { EasyConfig::PathResolver.config_path }
      it { should eq "/sinatra/config/*.yml" }
    end

    context "allow custom config path" do
      before { EasyConfig::PathResolver.config_path = './my_custom_path/' }
      subject { EasyConfig::PathResolver.config_path }
      it { should eq "./my_custom_path/*.yml" }
    end

    context "allow reset custom config path" do
      before { EasyConfig::PathResolver.config_path = './my_custom_path/' }
      subject {
        EasyConfig::PathResolver.config_path = nil
        module ::Rails; def self.root; "./"; end; end
        EasyConfig::PathResolver.config_path
      }
      after { Object.send(:remove_const, :Rails) }
      it { should eq "./config/*.yml" }
    end

    context "unknow config path" do
      it "should throw exception" do
        lambda { EasyConfig::PathResolver.config_path }.should raise_error(EasyConfig::UnknownConfigPath)
      end
    end
  end
end
