require 'spec_helper'

module VoipApi
  describe VoipApi do
    describe "concerning DEFAULT values" do
      it "knows the SANDBOX_WSDL" do
        Configuration::SANDBOX_WSDL.should eq("http://dev.voipinnovations.com/VOIP/Services/APIService.asmx?wsdl")
      end
      
      it "knows the PRODUCTION_WSDL" do
        Configuration::PRODUCTION_WSDL.should eq("https://backoffice.voipinnovations.com/Services/APIService.asmx?wsdl")
      end

      it "knows the DEFAULT_NAMESPACE" do
        Configuration::DEFAULT_NAMESPACE.should eq("http://tempuri.org/")
      end

      it "knows the VALID_OPTIONS" do
        Configuration::VALID_OPTIONS.should match_array([:login, :secret, :namespace, :wsdl, :filters, :use_sandbox, :use_test_wsdl])
      end

      it "knows the DEFAULT_FILTERS" do
        Configuration::DEFAULT_FILTERS.should match_array([:password, :secret, :pin])
      end

      it "knows the USE_SANDBOX_MODE" do
        Configuration::USE_SANDBOX_MODE.should be_false
      end

      it "knows the USE_TEST_WSDL_COPY" do
        Configuration::USE_TEST_WSDL_COPY.should be_true
      end

      it "knows how to map the options from an array into a hash with the values" do
        if VoipApi.account.use_sandbox
          # Sandbox WSDL
          if VoipApi.account.use_test_wsdl
            # Local copy
            my_wsdl = "spec/fixtures/wsdl/voip_sandbox_wsdl.asmx"
          else
            # Remote copy
            my_wsdl = Configuration::SANDBOX_WSDL
          end
        else
          # Production WSDL
          if VoipApi.account.use_test_wsdl
            # Local copy
            my_wsdl = "spec/fixtures/wsdl/voip_production_wsdl.asmx"
          else
            # Remote copy
            my_wsdl = Configuration::PRODUCTION_WSDL
          end
        end
        expected = {
          login: nil, 
          secret: nil, 
          namespace: "http://tempuri.org/", 
          wsdl: my_wsdl,
          filters: [:password, :secret, :pin],
          use_sandbox: false,
          use_test_wsdl: true,
        }
        VoipApi.options.should eq(expected)
      end

      it "should be able to create a new account" do
        VoipApi.account.should be_a(Account)
      end
    end
  end
end
