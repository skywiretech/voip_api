require 'spec_helper'

module VoipApi
  describe VoipApi do
    describe "concerning DEFAULT values" do
      it "knows the DEFAULT_WSDL" do
        Configuration::DEFAULT_WSDL.should eq("http://dev.voipinnovations.com/VOIP/Services/APIService.asmx?wsdl")
      end

      it "knows the DEFAULT_NAMESPACE" do
        Configuration::DEFAULT_NAMESPACE.should eq("http://tempuri.org/")
      end

      it "knows the VALID_OPTIONS" do
        Configuration::VALID_OPTIONS.should match_array([:login, :secret, :namespace, :wsdl, :filters])
      end

      it "knows the DEFAULT_FILTERS" do
        Configuration::DEFAULT_FILTERS.should match_array([:password, :secret])
      end

      it "knows how to map the options from an array into a hash with the values" do
        expected = {
          login: nil, 
          secret: nil, 
          namespace: "http://tempuri.org/", 
          wsdl: "http://dev.voipinnovations.com/VOIP/Services/APIService.asmx?wsdl",
          filters: [:password, :secret],
        }
        VoipApi.options.should eq(expected)
      end

      it "should be able to create a new client" do
        VoipApi.client.should be_a(Client)
      end
    end
  end
end
