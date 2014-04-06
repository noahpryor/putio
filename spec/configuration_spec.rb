require "spec_helper"

module Putio
  describe Configuration do
    describe "application_secret and client_id" do
      it "can be set" do
        config = Configuration.new
        config.application_secret = "test"
        config.client_id = 1
        config.client_id.should eq 1
        config.application_secret.should eq "test"
      end
    end
  end
end
