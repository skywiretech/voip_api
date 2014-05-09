require 'spec_helper'

# require the helper module
require "savon/mock/spec_helper"

module VoipApi
  module API
    describe DIDRequest do
      describe "concerning creating a new DID instance" do
        it "should know the sandbox operations" do
          DIDRequest.sandbox_soap_action_keys.should match_array([:assign_did, :audit_di_ds, :config_did, :get_did_count, :get_di_ds, :get_port_details, :is_portable, :query_did, :release_did, :reserve_did])
        end

        it "should know the production operations" do
          DIDRequest.production_soap_action_keys.should match_array([:assign_did, :audit_di_ds, :config_did, :get_did_count, :get_di_ds, :get_port_details, :is_portable, :query_did, :release_did, :reserve_did, :get_did_forward])
        end
      end

      describe "concerning querying the API" do
        # include the helper module
        include Savon::SpecHelper

        # set Savon in and out of mock mode
        before(:all) { savon.mock!   }
        after(:all)  { savon.unmock! }

        describe "#get_dids" do
          it "can get a list of the did_locators" do
            message = {
              login: VoipApi.login, 
              secret: VoipApi.secret,
              state: 'UT',
              npa: '435',
              lata: nil,
              rate_center: nil,
              nxx: nil,
              tier: nil,
              t_38: nil,
              cnam: nil,
            }
            fixture = File.read("spec/fixtures/did/get_dids.xml")

            # set up an expectation
            savon.expects(:get_di_ds).with(message: message).returns(fixture)

            # Query the API
            api = DIDRequest.new
            query = api.get_dids(state: 'UT', npa: '435')

            expect(query.response.savon).to be_successful
          end
        end

        describe "#query_did" do
          it "can query an existing DID" do
            message = { did: '4353198001', login: VoipApi.login, secret: VoipApi.secret }
            fixture = File.read("spec/fixtures/did/query_did.xml")

            # set up an expectation
            savon.expects(:query_did).with(message: message).returns(fixture)

            # Query the API
            api = DIDRequest.new
            query = api.query_did('4353198001')

            expect(query.response.savon).to be_successful
          end
        end
      end
    end

  end
end
