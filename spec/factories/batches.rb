FactoryBot.define do
  factory :batch do
    purchase_channel { "Site BR" }

    factory :batch_with_orders do
      transient do
        order_status { :production }
      end

      orders do
        @instance.orders << create_list(:order, 2, status: order_status)
        @instance.orders << create_list(:order, 3, status: order_status, delivery_service: 'FEDEX')
      end
    end
  end
end
