require 'spec_helper'

module VoipApi
  module APIResponse
    describe PortResponse do
      describe "concerning error codes" do
        it "can list the status code detail returned from the VOIP Innovations API" do
          PortResponse.status_code_detail(100).should match_array([:general, "Success"])
          PortResponse.status_code_detail(nil).should match_array([:unknown, "Unknown code: "])
        end
      end
    end
  end
end
