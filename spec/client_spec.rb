require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Putio" do
  describe "client" do
    before do
      Putio.configure do |config|
        config.application_secret = ENV["PUTIO_APPLICATION_SECRET"]
        config.client_id          = ENV["PUTIO_CLIENT_ID"]
      end
    end

    it "should connect with a valid auth token" do
      user_token = ENV["PUTIO_OAUTH_TOKEN"]
      client     = Putio::Client.new(user_token)
      client.files.class.should eq(Array)
    end

    it "should not connect with a valid auth token" do
      user_token = "FOO"
      client     = Putio::Client.new(user_token)
      expect { client.files }.to raise_error
    end
  end

end
