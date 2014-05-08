require 'spec_helper'

module VoipApi
  describe Client do
    describe "concerning creating a new client instance" do
      it "should default the values to those of the configuration values" do
        client = Client.new
        client.login.should be_nil
        client.password.should be_nil
        client.namespace.should eq(VoipApi::Configuration::DEFAULT_NAMESPACE)
        client.wsdl_endpoint.should eq(VoipApi::Configuration::DEFAULT_WSDL_ENDPOINT)
      end
    end
  end
end
