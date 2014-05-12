require 'spec_helper'

module VoipApi

  describe DIDResponse do
    describe "concerning error codes" do
      it "can list the status code detail returned from the VOIP Innovations API" do
        DIDResponse.status_code_detail(100).should match_array([:general, "Number is available, assigned, or reserved to you"])
        DIDResponse.status_code_detail(102230).should match_array([:query_did, "Number reserved to another company"])
        DIDResponse.status_code_detail(102235).should match_array([:query_did, "Number assigned to another company"])
        DIDResponse.status_code_detail(102420).should match_array([:query_did, "No records found"])
        DIDResponse.status_code_detail(302490).should match_array([:get_dids, "No search criteria defined"])
        DIDResponse.status_code_detail(nil).should match_array([:unknown, "Unknown code: "])
      end
    end
   end 

 end
