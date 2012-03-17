require 'spec_helper'

describe EasyConfig do
  context "mising methods" do
    it 'should treat it' do
      lambda { EasyConfig.facebook }.should_not raise_error
    end
  end

  context "access per env config file" do
    subject { EasyConfig.redis }
    its(:host) { should eq 'localhost' }
    its(:port) { should eq 4567 }
  end

  context "access simle config file" do
    subject { EasyConfig.github }
    its(:user) { should eq 'felipecvo' }
  end

  context "inexistent files" do
    subject { EasyConfig.no_exist }
    it { should be_nil }
  end
end
