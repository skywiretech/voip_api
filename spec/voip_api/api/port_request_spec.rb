require 'spec_helper'

# require the helper module
require "savon/mock/spec_helper"

module VoipApi
  module API
    describe PortRequest do
      describe "concerning creating a new DID instance" do
        it "should know the sandbox operations" do
          PortRequest.sandbox_soap_action_keys.should match_array([:get_port_details, :is_portable])
        end

        it "should know the production operations" do
          PortRequest.production_soap_action_keys.should match_array([:get_port_details, :is_portable])
        end
      end

      describe "concerning querying the API" do
        # include the helper module
        include Savon::SpecHelper

        # set Savon in and out of mock mode
        before(:all) { savon.mock!   }
        after(:all)  { savon.unmock! }

        describe '#get_port_details' do
          it "can get the details about a port" do
            message = {
              login:  VoipApi.account.login, 
              secret: VoipApi.account.secret,
              port_id: 36623,
            }
            fixture = File.read("spec/fixtures/port/get_port_details.xml")

            # set up an expectation
            savon.expects(:get_port_details).with(message: message).returns(fixture)

            # Query the API
            api = PortRequest.new
            query = api.get_port_details(36623)

            expect(query.response.savon).to be_successful
          end
        end

        describe '#is_portable' do
          it "can find out if a telephone number is portable" do
            message = {
              login:  VoipApi.account.login, 
              secret: VoipApi.account.secret,
              tn: "4352016526",
            }
            fixture = File.read("spec/fixtures/port/is_portable.xml")

            # set up an expectation
            savon.expects(:is_portable).with(message: message).returns(fixture)

            # Query the API
            api = PortRequest.new
            query = api.is_portable("4352016526")

            expect(query.response.savon).to be_successful
          end
        end

      end
    end

  end
end
