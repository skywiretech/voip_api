require 'spec_helper'

module VoipApi

  describe Response do
    describe "concerning error codes" do
      it "can list the status code detail returned from the VOIP Innovations API" do
        Response.status_code_detail(100).should match_array([:general, "Success"])
        Response.status_code_detail(101).should match_array([:general, "No Records Found"])
        Response.status_code_detail(900).should match_array([:general, "An exception occurred"])
        Response.status_code_detail(901).should match_array([:general, "Client IP not found"])
        Response.status_code_detail(902).should match_array([:general, "Username/password/IP not found"])
        Response.status_code_detail(944).should match_array([:general, "Invalid Number"])
        Response.status_code_detail(948).should match_array([:general, "You do not own the specified Endpoint Group"])
        Response.status_code_detail(nil).should match_array([:unknown, "Unknown code: "])
      end
    end
  end

end
