require 'spec_helper'

describe EasyConfig::EnvVar do
  class TestEnvVar
  end

  before do
    ENV['CLOUDAMQP_URL'] = 'amqp://user:pass@ec2.clustername.cloudamqp.com/vhost'
  end

  it 'has methods to retrieve values' do
    EasyConfig::EnvVar.setup(TestEnvVar)
    TestEnvVar.cloudamqp.url.should eq 'amqp://user:pass@ec2.clustername.cloudamqp.com/vhost'
  end
end
