require 'spec_helper'

describe EasyConfig::PathResolver do
  context "#config_paths" do
    before { EasyConfig::PathResolver.clear! }

    context "include Rails config dir" do
      before { module ::Rails; def self.root; "./"; end; end }
      after { Object.send(:remove_const, :Rails) }
      subject { EasyConfig::PathResolver.config_paths }
      it { should include("./config") }
    end

    context "include Sinatra config dir" do
      before { module ::Sinatra; module Application; def self.root; "/sinatra/"; end; end; end }
      after { Object.send(:remove_const, :Sinatra) }
      subject { EasyConfig::PathResolver.config_paths }
      it { should include "/sinatra/config" }
    end

    context "empty set" do
      it "doesn't raise exception" do
        EasyConfig::PathResolver.config_paths.size.should eq 0
      end
    end

    it "allows multiple paths" do
      EasyConfig::PathResolver.config_paths << './spec/config'
      EasyConfig::PathResolver.config_paths << './config'
      EasyConfig::PathResolver.config_paths.size.should eq 2
    end
  end
end
