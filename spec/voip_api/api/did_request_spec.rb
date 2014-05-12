require 'spec_helper'

# require the helper module
require "savon/mock/spec_helper"

module VoipApi
  module API
    describe DIDRequest do
      describe "concerning creating a new DID instance" do
        it "should know the sandbox operations" do
          DIDRequest.sandbox_soap_action_keys.should match_array([:assign_did, :audit_di_ds, :config_did, :get_did_count, :get_di_ds, :query_did, :release_did, :reserve_did])
        end

        it "should know the production operations" do
          DIDRequest.production_soap_action_keys.should match_array([:assign_did, :audit_di_ds, :config_did, :get_did_count, :get_di_ds, :query_did, :release_did, :reserve_did, :get_did_forward])
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

        describe "#get_did_count" do
          it "can get the list of the did_counts" do
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
              orderby: nil,
            }
            fixture = File.read("spec/fixtures/did/get_did_count.xml")

            # set up an expectation
            savon.expects(:get_did_count).with(message: message).returns(fixture)

            # Query the API
            api = DIDRequest.new
            query = api.get_did_count(state: 'UT', npa: '435')

            expect(query.response.savon).to be_successful
          end
        end

        describe "#audit_dids" do
          it "can return a collection of all the DIDs for the account" do
            message = { login: VoipApi.login, secret: VoipApi.secret }
            fixture = File.read("spec/fixtures/did/audit_dids.xml")

            # set up an expectation
            savon.expects(:audit_di_ds).with(message: message).returns(fixture)

            # Query the API
            api = DIDRequest.new
            query = api.audit_dids

            expect(query.response.savon).to be_successful
          end
        end

        describe "#reserve_did" do
          it "can reserve a DID for up to 30 minutes" do
            message = { 
              did_params: {"DIDParam" => {tn: '4352154006', epg: 8674, cnam: "1", refId: "bada55"}},
              login: VoipApi.login, 
              secret: VoipApi.secret 
            }
            fixture = File.read("spec/fixtures/did/reserve_did.xml")

            # set up an expectation
            savon.expects(:reserve_did).with(message: message).returns(fixture)

            # Query the API
            api = DIDRequest.new
            query = api.reserve_did('4352154006', 8674, "1", "bada55")

            expect(query.response.savon).to be_successful
          end
        end

        describe "#release_did" do
          it "can reserve a DID for up to 30 minutes" do
            message = { 
              did_params: {"DIDParam" => {tn: '4352154006'}},
              login: VoipApi.login, 
              secret: VoipApi.secret 
            }
            fixture = File.read("spec/fixtures/did/release_did.xml")

            # set up an expectation
            savon.expects(:release_did).with(message: message).returns(fixture)

            # Query the API
            api = DIDRequest.new
            query = api.release_did('4352154006')

            expect(query.response.savon).to be_successful
          end
        end
        
      end
    end

  end
end
