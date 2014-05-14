require 'spec_helper'

# require the helper module
require "savon/mock/spec_helper"

module VoipApi
  module API
    describe X911Request do
      describe "concerning creating a new DID instance" do
        it "should know the sandbox operations" do
          X911Request.sandbox_soap_action_keys.should match_array([])
        end

        it "should know the production operations" do
          X911Request.production_soap_action_keys.should match_array(
          [:add911_alert, :add_location, :audit911, :get_locations, :get_provisioning_history, :insert911, :provision_location, :query911, :query911_alert, :remove911, :remove911_alert, :remove_location, :update911, :validate911])
        end
      end

      describe "concerning querying the API" do
        # include the helper module
        include Savon::SpecHelper

        # set Savon in and out of mock mode
        before(:all) { savon.mock!   }
        after(:all)  { savon.unmock! }

        describe "#audit911" do
          it "can return a collection of all the 911 DIDs for the account" do
            message = { login: VoipApi.login, secret: VoipApi.secret }
            fixture = File.read("spec/fixtures/x911/audit_911.xml")

            # set up an expectation
            savon.expects(:audit911).with(message: message).returns(fixture)

            # Query the API
            api = X911Request.new
            query = api.audit_911

            expect(query.response.savon).to be_successful
          end
        end

        describe '#get_locations' do
          it "can get the locations associated with a 911 number" do
            message = {
              login: VoipApi.login, 
              secret: VoipApi.secret,
              did: "4353198001",
            }
            fixture = File.read("spec/fixtures/x911/get_locations.xml")

            # set up an expectation
            savon.expects(:get_locations).with(message: message).returns(fixture)

            # Query the API
            api = X911Request.new
            query = api.get_locations("4353198001")

            expect(query.response.savon).to be_successful
          end
        end

        describe '#query_911' do
          it "can query a specific 911 number" do
            message = {
              login: VoipApi.login, 
              secret: VoipApi.secret,
              did: "4353198001",
            }
            fixture = File.read("spec/fixtures/x911/query_911.xml")

            # set up an expectation
            savon.expects(:query911).with(message: message).returns(fixture)

            # Query the API
            api = X911Request.new
            query = api.query_911("4353198001")

            expect(query.response.savon).to be_successful
          end
        end

        describe "#validate_911" do
          it "can validate the 911 stuff" do
            message = {
              login: VoipApi.login, 
              secret: VoipApi.secret,
              address1: "833 E TABERNACLE ST",
              address2: "",
              city: "SAINT GEORGE",
              state: "UT",
              zip: "84770",
              plus_four: "3059",
              caller_name: "Campus Villas",
            }
            fixture = File.read("spec/fixtures/x911/validate_911.xml")

            # set up an expectation
            savon.expects(:validate911).with(message: message).returns(fixture)

            # Query the API
            api = X911Request.new
            query = api.validate_911("833 E TABERNACLE ST", "", "SAINT GEORGE", "UT", "84770", "3059", "Campus Villas")

            expect(query.response.savon).to be_successful
          end
        end

        describe '#get_provisioning_history' do
          it "can get the provisioning history and locations" do
            message = {
              login: VoipApi.login, 
              secret: VoipApi.secret,
              did: "4353198001",
            }
            fixture = File.read("spec/fixtures/x911/get_provisioning_history.xml")

            # set up an expectation
            savon.expects(:get_provisioning_history).with(message: message).returns(fixture)

            # Query the API
            api = X911Request.new
            query = api.get_provisioning_history("4353198001")

            expect(query.response.savon).to be_successful
          end
        end

        describe "#query_911_alert" do
          it "can return the 911 alerts for the number being queried" do
            pending "write me"
          end
          
        end

      describe "#add_location" do
          it "can add a new location" do
            pending "write me"
            # message = {
            #   login: VoipApi.login, 
            #   secret: VoipApi.secret,
            #   address1: "150 NORTH 200 EAST",
            #   address2: "Suite 201",
            #   city: "SAINT GEORGE",
            #   state: "UT",
            #   zip: "84770",
            #   plus_four: "",
            #   caller_name: "Mango Voice",
            # }
            # fixture = File.read("spec/fixtures/x911/add_location.xml")

            # # set up an expectation
            # savon.expects(:add_location).with(message: message).returns(fixture)

            # # Query the API
            # api = X911Request.new
            # query = api.add_location("150 NORTH 200 EAST", "Suite 201", "SAINT GEORGE", "UT", "84770", "", "Mango Voice")

            # expect(query.response.savon).to be_successful
          end
        end

      end
    end

  end
end
