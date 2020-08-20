require "rails_helper"

RSpec.describe Api::V1::OrdersController, type: :routing do
  describe "routing" do
    context 'to Order' do
      it "routes to #status" do
        expect(:get => "/api/v1/orders/status").to route_to("api/v1/orders#check_status")
      end

      it "routes to #list" do
        expect(:get => "/api/v1/orders/Site-BR/list").to route_to("api/v1/orders#list", :purchase_channel => "Site-BR")
      end

      it "routes to #create" do
        expect(:post => "/api/v1/orders").to route_to("api/v1/orders#create")
      end
    end
  end
end
