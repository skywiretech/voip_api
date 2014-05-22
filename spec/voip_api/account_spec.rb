require 'spec_helper'

module VoipApi
  describe Account do

    describe "concerning creating a new account instance" do
      describe "concerning SANDBOX mode" do
        it "uses the local sandbox copy in test mode" do
          account = Account.new(use_sandbox: true, use_test_wsdl: true)
          account.use_sandbox.should be_true
          account.use_test_wsdl.should be_true
          account.wsdl.should eq("spec/fixtures/wsdl/voip_sandbox_wsdl.asmx")
        end

        it "uses the remote sandbox copy when NOT in test mode" do
          account = Account.new(use_sandbox: true, use_test_wsdl: false)
          account.use_sandbox.should be_true
          account.use_test_wsdl.should be_false
          account.wsdl.should eq(VoipApi::Configuration::SANDBOX_WSDL)
        end
      end

      describe "concerning PRODUCTION mode" do
        it "uses the local production copy in test mode" do
          account = Account.new(use_sandbox: false, use_test_wsdl: true)
          account.use_sandbox.should be_false
          account.use_test_wsdl.should be_true
          account.wsdl.should eq("spec/fixtures/wsdl/voip_production_wsdl.asmx")
        end

        it "uses the remote production copy when NOT in test mode" do
          account = Account.new(use_sandbox: false, use_test_wsdl: false)
          account.use_sandbox.should be_false
          account.use_test_wsdl.should be_false
          account.wsdl.should eq(VoipApi::Configuration::PRODUCTION_WSDL)
        end
      end

      describe "concerning other defaults" do
        let(:account) { Account.new }
        
        it "should set the default login and secret" do
          account.login.should be_nil
          account.secret.should be_nil
        end

        it "should pull in the default namespace" do
          account.namespace.should eq(VoipApi::Configuration::DEFAULT_NAMESPACE)
        end

        it "should pull in the default filters" do
          account.filters.should eq(VoipApi::Configuration::DEFAULT_FILTERS)
        end
      end
    end

  end
end
