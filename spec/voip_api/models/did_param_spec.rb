require 'spec_helper'

module VoipApi
  describe DIDParam do
    
    describe "concerning converting stuff from VOIP api casing to our standard camelcasing" do
      it "can give you a description of an attribute" do
        DIDParam.description(:tn).should eq("Telephone number of the DID to be modified")
        DIDParam.description(:epg).should eq("Endpoint Group ID")
        DIDParam.description(:cnam).should eq("This is the bit value 0 or 1 for setting inbound CNam dips inactive (0) or active (1)")
        DIDParam.description(:ref_id).should eq("This is the customer-defined reference ID associated with this request. This field is purely for the benefit of the API user and could potentially be used to associate a customer ID, order ID, or any other reference ID to an API request.")
      end

      it "should be able to create a new DIDParam from their erratic variable names" do
        hashie_params = VoipApi::Mapping::VoipDIDParam.new({
          tn: 'tn',
          epg: 37,
          cnam: 'cnam',
          refId: 'refId',
        })
        dp = DIDParam.new(hashie_params)
        dp.tn.should eq("tn")
        dp.epg.should eq(37)
        dp.cnam.should eq("cnam")
        dp.ref_id.should eq("refId")
      end
    end
    
  end
end
