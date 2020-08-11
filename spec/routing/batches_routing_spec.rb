require "rails_helper"

RSpec.describe Api::V1::BatchesController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/api/v1/batches").to route_to("api/v1/batches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/batches/47d63d2/produce").to route_to("api/v1/batches#produce", :reference => "47d63d2")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/batches/47d63d2/close").to route_to("api/v1/batches#close", :reference => "47d63d2")
    end
  end
end
