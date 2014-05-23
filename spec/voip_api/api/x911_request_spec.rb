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
            message = { login: VoipApi.account.login, secret: VoipApi.account.secret }
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
              login: VoipApi.account.login, 
              secret: VoipApi.account.secret,
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
              login: VoipApi.account.login, 
              secret: VoipApi.account.secret,
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
              login: VoipApi.account.login, 
              secret: VoipApi.account.secret,
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
              login: VoipApi.account.login, 
              secret: VoipApi.account.secret,
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
            message = {
              login: VoipApi.account.login, 
              secret: VoipApi.account.secret,
              tn: "4353198001",
            }
            fixture = File.read("spec/fixtures/x911/query_911_alert.xml")

            # set up an expectation
            savon.expects(:query911_alert).with(message: message).returns(fixture)

            # Query the API
            api = X911Request.new
            query = api.query_911_alert("4353198001")

            expect(query.response.savon).to be_successful
          end
        end

        describe "#add_location" do
          it "can add a new location" do
            message = {
              login: VoipApi.account.login, 
              secret: VoipApi.account.secret,
              did: '4353198001',
              address1: "150 NORTH 200 EAST",
              address2: "Suite 201",
              city: "SAINT GEORGE",
              state: "UT",
              zip: "84770",
              plus_four: "",
              caller_name: "Mango Voice",
            }
            fixture = File.read("spec/fixtures/x911/add_location.xml")

            # set up an expectation
            savon.expects(:add_location).with(message: message).returns(fixture)

            # Query the API
            api = X911Request.new
            query = api.add_location("4353198001", "150 NORTH 200 EAST", "Suite 201", "SAINT GEORGE", "UT", "84770", "", "Mango Voice")

            expect(query.response.savon).to be_successful
          end
        end

        describe "#remove_location" do
          it "can add remove an existing location" do
            message = {
              login: VoipApi.account.login, 
              secret: VoipApi.account.secret,
              did: '4353198001',
              location_id: "18628501",
            }
            fixture = File.read("spec/fixtures/x911/remove_location.xml")

            # set up an expectation
            savon.expects(:remove_location).with(message: message).returns(fixture)

            # Query the API
            api = X911Request.new
            query = api.remove_location("18628501", "4353198001")

            expect(query.response.savon).to be_successful
          end
        end

        describe '#provision_location' do
          it "can provision a location to a DID" do
            message = {
              login: VoipApi.account.login, 
              secret: VoipApi.account.secret,
              did: "4353198001",
              location_id: "18637602",
            }
            fixture = File.read("spec/fixtures/x911/provision_location.xml")

            # set up an expectation
            savon.expects(:provision_location).with(message: message).returns(fixture)

            # Query the API
            api = X911Request.new
            query = api.provision_location("4353198001", "18637602")

            expect(query.response.savon).to be_successful
          end
        end

        describe '#remove_911' do
          it "can remove the 911 information from a DID" do
            message = {
              login: VoipApi.account.login, 
              secret: VoipApi.account.secret,
              did: "4353198001",
            }
            fixture = File.read("spec/fixtures/x911/remove_911.xml")

            # set up an expectation
            savon.expects(:remove911).with(message: message).returns(fixture)

            # Query the API
            api = X911Request.new
            query = api.remove_911("4353198001")

            expect(query.response.savon).to be_successful
          end
        end

        describe "#insert_911" do
          it "can insert 911 information directly into a DID" do
            message = {
              login: VoipApi.account.login, 
              secret: VoipApi.account.secret,
              did: '4353198001',
              address1: "150 NORTH 200 EAST",
              address2: "Suite 201",
              city: "SAINT GEORGE",
              state: "UT",
              zip: "84770",
              plus_four: "",
              caller_name: "Mango Voice",
            }
            fixture = File.read("spec/fixtures/x911/insert_911.xml")

            # set up an expectation
            savon.expects(:insert911).with(message: message).returns(fixture)

            # Query the API
            api = X911Request.new
            query = api.insert_911("4353198001", "150 NORTH 200 EAST", "Suite 201", "SAINT GEORGE", "UT", "84770", "", "Mango Voice")

            expect(query.response.savon).to be_successful
          end
        end

        describe "#update_911" do
          it "can update existing 911 information for an existing DID" do
            message = {
              login: VoipApi.account.login, 
              secret: VoipApi.account.secret,
              did: '4353198001',
              address1: "150 NORTH 200 EAST",
              address2: "Suite 201",
              city: "SAINT GEORGE",
              state: "UT",
              zip: "84770",
              plus_four: "",
              caller_name: "Mango Voice",
            }
            fixture = File.read("spec/fixtures/x911/update_911.xml")

            # set up an expectation
            savon.expects(:update911).with(message: message).returns(fixture)

            # Query the API
            api = X911Request.new
            query = api.update_911("4353198001", "150 NORTH 200 EAST", "Suite 201", "SAINT GEORGE", "UT", "84770", "", "Mango Voice")

            expect(query.response.savon).to be_successful
          end
        end

      end
    end

  end
end
