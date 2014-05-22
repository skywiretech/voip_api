require 'spec_helper'

module VoipApi

  describe X911Response do
    describe "concerning error codes" do
      it "can list the status code detail returned from the VOIP Innovations API" do
        X911Response.status_code_detail(100).should match_array([:general, "Success"])
        X911Response.status_code_detail(101 ).should match_array([:general, "No records found"])
        X911Response.status_code_detail(903).should match_array([:response_911, "Could not locate Dash Emergency Provisioning Service"])
        X911Response.status_code_detail(904).should match_array([:response_911, "Dash action resulted in incorrect status"])
        X911Response.status_code_detail(905).should match_array([:response_911, "LockedException occurred while calling Dash service"])
        X911Response.status_code_detail(906).should match_array([:response_911, "NotFoundException occurred while calling Dash service"])
        X911Response.status_code_detail(907).should match_array([:response_911, "API LockedException; The specified DID record is currently in use"])
        X911Response.status_code_detail(908).should match_array([:response_911, "ParseException occurred while calling Dash service for the specified telephone number"])
        X911Response.status_code_detail(909).should match_array([:response_911, "You do not own the specified number"])
        X911Response.status_code_detail(910).should match_array([:response_911, "Location does not exist"])
        X911Response.status_code_detail(911).should match_array([:response_911, "Location already exists and is provisioned"])
        X911Response.status_code_detail(940).should match_array([:add_911_alert, "Email cannot be greater than 150 characters"])
        X911Response.status_code_detail(941).should match_array([:add_911_alert, "911 is not enabled"])
        X911Response.status_code_detail(942).should match_array([:add_911_alert, "Email already exists for this DID"])
        X911Response.status_code_detail(943).should match_array([:add_911_alert, "Can not exceed 10 emails"])
        X911Response.status_code_detail(205100).should match_array([:remove_location, "Location successfully removed"])
        X911Response.status_code_detail(205200).should match_array([:remove_911, "Zero records deleted/archived"])
        X911Response.status_code_detail(206200).should match_array([:get_locations, "No locations could be found"])
        X911Response.status_code_detail(nil).should match_array([:unknown, "Unknown code: "])
      end

      it "can give a details status for the actual 911 response" do
        X911Response.status_911_detail("INVALID").should match_array([:general, "Unable to geocoded address"])
        X911Response.status_911_detail("PROVISIONED").should match_array([:general, "Location is currently provisioned for URI"])
        X911Response.status_911_detail("GEOCODED").should match_array([:general, "Location is geocoded"])
        X911Response.status_911_detail(nil).should match_array([:unknown, "Unknown status code: "])
      end
    end
  end
  
end
