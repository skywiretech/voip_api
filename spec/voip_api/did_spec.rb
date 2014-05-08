require 'spec_helper'

module VoipApi
  describe DID do
    describe "concerning creating a new DID instance" do
      let(:did) { DID.new }

      it "should know the sandbox operations" do
        DID.sandbox_operations.should match_array([:audit_di_ds, :assign_did, :config_did, :query_did, :release_did, :reserve_did])
      end

      it "should know the production operations" do
        DID.production_operations.should match_array([:audit_di_ds, :assign_did, :config_did, :query_did, :release_did, :reserve_did, :get_did_forward])
      end

      it "should return the soap_action used to invoke the API request for now" do
        DID.production_operations.each do |action|
          if action == :audit_di_ds
            did.send(:audit_dids).should eq(action)
          else
            did.send(action).should eq(action)
          end
        end
      end
    end
  end
end
