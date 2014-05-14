require 'spec_helper'

module VoipApi

  describe DIDResponse do
    describe "concerning error codes" do
      it "can list the status code detail returned from the VOIP Innovations API" do
        DIDResponse.status_code_detail(100).should match_array([:general, "Number is available, assigned, or reserved to you"])
        DIDResponse.status_code_detail(104220).should match_array([:assign_dids, "Number is already reserved for you"])
        DIDResponse.status_code_detail(104221).should match_array([:assign_dids, "Unknown error assigning number"])
        DIDResponse.status_code_detail(104225).should match_array([:assign_dids, "Number is already assigned to you"])
        DIDResponse.status_code_detail(104230).should match_array([:assign_dids, "Number is already reserved for another company"])
        DIDResponse.status_code_detail(104235).should match_array([:assign_dids, "Number is already assigned to another company"])
        DIDResponse.status_code_detail(104250).should match_array([:assign_dids, "You do not purchase 800 Origination services"])
        DIDResponse.status_code_detail(104251).should match_array([:assign_dids, "You do not purchase standard origination services"])
        DIDResponse.status_code_detail(104258).should match_array([:assign_dids, "Bad Endpoint Group. This remote is not allowed to service this endpoint group"])
        DIDResponse.status_code_detail(104259).should match_array([:assign_dids, "Tier not available to your account"])
        DIDResponse.status_code_detail(104420).should match_array([:assign_dids, "Could not find number"])
        DIDResponse.status_code_detail(101200).should match_array([:audit_dids, "No records found"])
        DIDResponse.status_code_detail(105221).should match_array([:config_did, "Number is not currently assigned to you"])
        DIDResponse.status_code_detail(105225).should match_array([:config_did, "Number is reserved for you"])
        DIDResponse.status_code_detail(105230).should match_array([:config_did, "Number is already reserved for another company"])
        DIDResponse.status_code_detail(105235).should match_array([:config_did, "Number is already assigned to another company"])
        DIDResponse.status_code_detail(105250).should match_array([:config_did, "You do not purchase 800 Origination services"])
        DIDResponse.status_code_detail(105251).should match_array([:config_did, "You do not purchase standard origination services"])
        DIDResponse.status_code_detail(105258).should match_array([:config_did, "Bad Endpoint Group. This remote is not allowed to service this endpoint group"])
        DIDResponse.status_code_detail(105420).should match_array([:config_did, "Could not find number"])
        DIDResponse.status_code_detail(102230).should match_array([:query_did, "Number reserved for another company"])
        DIDResponse.status_code_detail(102235).should match_array([:query_did, "Number assigned to another company"])
        DIDResponse.status_code_detail(102420).should match_array([:query_did, "No records found"])
        DIDResponse.status_code_detail(106220).should match_array([:release_did, "Number is still reserved for you"])
        DIDResponse.status_code_detail(106225).should match_array([:release_did, "Number is still assigned to you"])
        DIDResponse.status_code_detail(106230).should match_array([:release_did, "Number is currently reserved for another company"])
        DIDResponse.status_code_detail(106231).should match_array([:release_did, "Number currently available"])
        DIDResponse.status_code_detail(106235).should match_array([:release_did, "Number is currently assigned to another company"])
        DIDResponse.status_code_detail(106241).should match_array([:release_did, "Number previously released, but not currently available"])
        DIDResponse.status_code_detail(106420).should match_array([:release_did, "Could not find number"])
        DIDResponse.status_code_detail(103220).should match_array([:reserve_did, "Number already reserved for you"])
        DIDResponse.status_code_detail(103221).should match_array([:reserve_did, "Unknown error reserving number"])
        DIDResponse.status_code_detail(103225).should match_array([:reserve_did, "Number already assigned to you"])
        DIDResponse.status_code_detail(103230).should match_array([:reserve_did, "Number is currently reserved for another company"])
        DIDResponse.status_code_detail(103235).should match_array([:reserve_did, "Number is currently assigned to another company"])
        DIDResponse.status_code_detail(103250).should match_array([:reserve_did, "You do not purchase 800 Origination Services"])
        DIDResponse.status_code_detail(103259).should match_array([:reserve_did, "Tier not available to your account"])
        DIDResponse.status_code_detail(103420).should match_array([:reserve_did, "Could not find number"])
        DIDResponse.status_code_detail(302490).should match_array([:get_dids, "No search criteria defined"])
        DIDResponse.status_code_detail(nil).should match_array([:unknown, "Unknown code: "])
      end
    end
  end 

 end
