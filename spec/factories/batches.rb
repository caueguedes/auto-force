FactoryBot.define do
  factory :batch do
    purchase_channel { "Site BR" }

    trait :have_enough_orders do
      before(:build) do
        create(:order, reference:"BR102030")
        create(:order, reference:"BR102031")
        create(:order, reference:"BR102032", purchase_channel:'Site USD')
        create(:order, reference:"BR102033", status: 3)
        create(:order, reference:"BR102034", status: 2)
        create(:order, reference:"BR102035", status: 2)
        create(:order, reference:"BR102036", status: 2, purchase_channel:'Web BR')
        create(:order, reference:"BR102037", status: 2, purchase_channel:'Site USD')
      end
    end

    trait :without_enough_orders do
      before(:build) do
        create(:order, reference:"BR102030")
        create(:order, reference:"BR102031")
        create(:order, reference:"BR102032", purchase_channel:'Site USD')
        create(:order, reference:"BR102033", status: 3)
        create(:order, reference:"BR102034", status: 2)
        create(:order, reference:"BR102035", status: 2)
        create(:order, reference:"BR102036", status: 2, purchase_channel:'Web BR')
        create(:order, reference:"BR102037", status: 2, purchase_channel:'Site USD')
      end
    end
  end
end
