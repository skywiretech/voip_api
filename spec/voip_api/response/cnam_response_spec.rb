require 'spec_helper'

module VoipApi
  module APIResponse
    describe CNAMResponse do
      describe "concerning error codes" do
        it "can list the status code detail returned from the VOIP Innovations API" do
          CNAMResponse.status_code_detail(100).should match_array([:general, "Success"])
          CNAMResponse.status_code_detail(933).should match_array([:update_cnam_display, "Outbound CNAM is not available for the specified DID"])
          CNAMResponse.status_code_detail(934).should match_array([:update_cnam_display, "Invalid name. Valid characters are letters, spaces, and numbers"])
          CNAMResponse.status_code_detail(nil).should match_array([:unknown, "Unknown code: "])
        end
      end
    end
  end
end
