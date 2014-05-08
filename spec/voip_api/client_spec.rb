require 'spec_helper'

module VoipApi
  describe Client do
    describe "concerning creating a new client instance" do
      let(:client) { Client.new }

      it "should set the default login and secret" do
        client.login.should be_nil
        client.secret.should be_nil
      end

      it "should pull in the default namespace" do
        client.namespace.should eq(VoipApi::Configuration::DEFAULT_NAMESPACE)
      end

      it "should pull in the default WSDL" do
        client.wsdl.should eq(VoipApi::Configuration::DEFAULT_WSDL)
      end

      it "should pull in the default filters" do
        client.filters.should eq(VoipApi::Configuration::DEFAULT_FILTERS)
      end
    end

    describe "concerning creating requests" do
      pending "it can create requests"
    end
  end
end
