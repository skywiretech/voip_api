require 'spec_helper'

module VoipApi
  describe VoipApi do
    describe "concerning DEFAULT values" do
      it "knows the DEFAULT_WSDL_ENDPOINT" do
        Configuration::DEFAULT_WSDL_ENDPOINT.should eq("http://dev.voipinnovations.com/VOIP/Services/APIService.asmx?wsdl")
      end

      it "knows the DEFAULT_NAMESPACE" do
        Configuration::DEFAULT_NAMESPACE.should eq("http://tempuri.org/")
      end

      it "knows the VALID_OPTIONS" do
        Configuration::VALID_OPTIONS.should match_array([:login, :password, :namespace, :wsdl_endpoint])
      end

      it "knows how to map the options from an array into a hash with the values" do
        expected = {login: nil, password: nil, namespace: "http://tempuri.org/", wsdl_endpoint: "http://dev.voipinnovations.com/VOIP/Services/APIService.asmx?wsdl"}
        VoipApi.options.should eq(expected)
      end
    end
  end
end
