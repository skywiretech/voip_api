require 'spec_helper'

# require the helper module
require "savon/mock/spec_helper"

module VoipApi
  module API
    describe CNAMRequest do
      describe "concerning creating a new DID instance" do
        it "should know the sandbox operations" do
          CNAMRequest.sandbox_soap_action_keys.should match_array([:get_cnam_display, :update_cnam_display, :remove_cnam])
        end

        it "should know the production operations" do
          CNAMRequest.production_soap_action_keys.should match_array([:get_cnam_display, :update_cnam_display, :remove_cnam])
        end
      end

      describe "concerning querying the API" do
        # include the helper module
        include Savon::SpecHelper

        # set Savon in and out of mock mode
        before(:all) { savon.mock!   }
        after(:all)  { savon.unmock! }

        describe '#get_cnam_display' do
          it "can get the cnam details about a DID" do
            message = {
              login:  VoipApi.account.login,
              secret: VoipApi.account.secret,
              tn: '4353198001',
            }
            fixture = File.read("spec/fixtures/cnam/get_cnam_display.xml")

            # set up an expectation
            savon.expects(:get_cnam_display).with(message: message).returns(fixture)

            # Query the API
            api = CNAMRequest.new
            query = api.get_cnam_display('4353198001')

            expect(query.response.savon).to be_successful
          end
        end

        describe '#update_cnam_display' do
          it "can get the cnam details about a DID" do
            message = {
              login:  VoipApi.account.login,
              secret: VoipApi.account.secret,
              tn: '4353198001',
              name: 'Testing 123',
            }
            fixture = File.read("spec/fixtures/cnam/update_cnam_display.xml")

            # set up an expectation
            savon.expects(:update_cnam_display).with(message: message).returns(fixture)

            # Query the API
            api = CNAMRequest.new
            query = api.update_cnam_display('4353198001', 'Testing 123')

            expect(query.response.savon).to be_successful
          end
        end

        describe '#remove_cnam' do
          it "can get the cnam details about a DID" do
            message = {
              login:  VoipApi.account.login,
              secret: VoipApi.account.secret,
              tn: '4353198001',
            }
            fixture = File.read("spec/fixtures/cnam/remove_cnam.xml")

            # set up an expectation
            savon.expects(:remove_cnam).with(message: message).returns(fixture)

            # Query the API
            api = CNAMRequest.new
            query = api.remove_cnam('4353198001')

            expect(query.response.savon).to be_successful
          end
        end

      end

    end

  end
end
