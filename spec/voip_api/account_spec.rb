require 'spec_helper'

module VoipApi
  describe Account do
    describe "concerning creating a new account instance" do
      let(:account) { Account.new }

      it "should set the default login and secret" do
        account.login.should be_nil
        account.secret.should be_nil
      end

      it "should pull in the default namespace" do
        account.namespace.should eq(VoipApi::Configuration::DEFAULT_NAMESPACE)
      end

      it "should pull in the default WSDL" do
        account.wsdl.should eq(VoipApi::Configuration::DEFAULT_WSDL)
      end

      it "should pull in the default filters" do
        account.filters.should eq(VoipApi::Configuration::DEFAULT_FILTERS)
      end
    end
  end
end
