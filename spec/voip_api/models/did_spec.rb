require 'spec_helper'

module VoipApi
  module Models
    describe DID do
      describe "concerning converting stuff from VOIP api casing to our standard camelcasing" do
        it "can give you a description of an attribute" do
          DID.description(:tn).should eq("Telephone number")
          DID.description(:availability).should eq("Defines the status of the returned TN")
          DID.description(:rewrite).should eq("Used in rewriting the DNIS for the TN if assigned to you or reserved by you")
          DID.description(:status).should eq("This is the status of a request, for example 'Success'")
          DID.description(:status_code).should eq("Each status has a matching numerical value, for example, a 'Success' status has a '100' statusCode")
          DID.description(:tier).should eq("Pricing tier on which the number resides")
          DID.description(:ref_id).should eq("This is the customer-defined Reference ID that is associated with this request. This field is purely for the benefit of the API user, and could potentially be used to associate a Customer ID, Order ID, or any other Reference ID to an API request.")
          DID.description(:cnam_name).should eq("CNAM Storage Display Name")
          DID.description(:state).should eq("The two letter abbreviation for the state in which the TN resides")
          DID.description(:rate_center).should eq("Rate Center that services DID")
          DID.description(:did_group_id).should eq("ID number of the DID Group")
          DID.description(:network).should eq("The network on which the DID resides")
          DID.description(:endpoint_id).should eq("This will return an integer that defines which endpoint group ID this TN will route to if the TN is assigned to you or reserved by you. This can be changed by performing a configDID request.")
          DID.description(:has_411).should eq("Indicates if the DID currently has a 411 registered address")
          DID.description(:has_911).should eq("Indicates if the DID currently has an e911 registered address")
          DID.description(:cnam).should eq("Denotes whether or not inbound cnam dip is active for the DID")
          DID.description(:cnam_storage_active).should eq("Denotes whether or not a Cnam Storage record is on file in our database for the DID")
          DID.description(:cnam_storage_availability).should eq("Denotes whether or not DID supports Cnam Storage capability")
          DID.description(:t_38).should eq("Denotes whether or not DID is T38 capable")
          DID.description(:failover).should eq("Failover number (if set) on the DID. This field is only included with the GetDIDFailover method.")
          DID.description(:forward).should eq("Forward number (if set) on the DID. This field is only included with the GetDIDForward method.")
        end

        it "should be able to create a new DID from their erratic variable names" do
          hashie_params = VoipApi::Mapping::VoipDID.new({
            tn: "2015649083",
            availability: "assigned",
            rewrite: "2015649083",
            status: "Number currently assigned to you with refid '' rewritten as '2015649083' to endpoint '7042'",
            statusCode: "100",
            tier: "0",
            refId: nil,
            cnamName: nil,
            state: "NJ",
            rateCenter: "CLOSTER",
            didGroupId: "0",
            network: "Blitztel",
            endpointId: "7042",
            has411: false,
            has911: false,
            cnam: false,
            cnamStorageActive: false,
            cnamStorageAvailability: false,
            t38: false,
          })
          did = DID.new(hashie_params)
          did.tn.should eq("2015649083")
          did.availability.should eq("assigned")
          did.rewrite.should eq("2015649083")
          did.status.should eq("Number currently assigned to you with refid '' rewritten as '2015649083' to endpoint '7042'")
          did.status_code.should eq("100")
          did.tier.should eq("0")
          did.ref_id.should be_nil
          did.cnam_name.should be_nil
          did.state.should eq("NJ")
          did.rate_center.should eq("CLOSTER")
          did.did_group_id.should eq("0")
          did.network.should eq("Blitztel")
          did.endpoint_id.should eq("7042")
          did.has_411.should be_false
          did.has_911.should be_false
          did.cnam.should be_false
          did.cnam_storage_active.should be_false
          did.cnam_storage_availability.should be_false
          did.t_38.should be_false
        end
      end

      describe "concerning enumerable and sorting modules" do
        it "should be able to be sorted by telephone number" do
          @did_1 = DID.new(tn: '4355551233')
          @did_2 = DID.new(tn: '4355551234')
          [@did_2, @did_1].sort.should match_array([@did_1, @did_2])
        end
      end
    end
  end
end
