FactoryBot.define do
  factory :order do
    reference { "MyString" }
    purchase_channel { "MyString" }
    client_name { "MyString" }
    address { "MyText" }
    delivery_service { "MyString" }
    total_value { "9.99" }
    line_items { "" }
    status { 1 }
  end
end
