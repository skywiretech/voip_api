require 'spec_helper'

module VoipApi
  module API
    describe ApiRequest do
      it "knows the constant X911_REQUEST_ACTIONS" do
        ApiRequest::X911_REQUEST_ACTIONS.should match_array(
          [
            :add_location,
            :audit_911,
            :get_locations,
            :get_provisioning_history,
            :insert_911,
            :provision_location,
            :query_911,
            :query_911_alert,
            :remove_911,
            :remove_location,
            :update_911,
            :validate_911,
          ]
        )
      end

      it "knows the constant PORT_REQUEST_ACTIONS" do
        ApiRequest::PORT_REQUEST_ACTIONS.should match_array([:get_port_details, :is_portable])
      end

      it "knows the constant DID_REQUEST_ACTIONS" do
        ApiRequest::DID_REQUEST_ACTIONS.should match_array(
          [
            :assign_did,
            :audit_dids,
            :config_did,
            :get_did_count,
            :get_dids,
            :query_did,
            :release_did,
            :reserve_did,
          ]
        )
      end

      it "knows the delegated_klass for the appropriate actions" do
        # DID
        ApiRequest::DID_REQUEST_ACTIONS.each do |action|
          ApiRequest.delegated_klass(action).should eq(VoipApi::API::DIDRequest)
        end

        # Port
        ApiRequest::PORT_REQUEST_ACTIONS.each do |action|
          ApiRequest.delegated_klass(action).should eq(VoipApi::API::PortRequest)
        end

        # X911
        ApiRequest::X911_REQUEST_ACTIONS.each do |action|
          ApiRequest.delegated_klass(action).should eq(VoipApi::API::X911Request)
        end
      end
    end
  end
end
