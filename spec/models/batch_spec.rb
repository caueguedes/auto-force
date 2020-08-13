require 'rails_helper'

RSpec.describe Batch, type: :model do
  let(:order1) { build_stubbed(:order, reference:"BR102030") }
  let(:order2) { build_stubbed(:order, reference:"BR102031") }

  context 'have enough records to generate a Batch' do
    let(:batch) { create(:batch, :with_enough_orders) }

    it 'creates a Batch' do
      # batch = create(:batch, :with_enough_orders)
      expect(batch).to be_valid
      binding.pry
      expect(batch.orders.count).to eql 2
      expect(batch.orders.first.batch_id).not_to be_nil
      expect(batch.orders.first.status).to eql "production"
    end
  end

  context 'have a batch created(publishe with orders production)' do

  end

  context 'does not have enough records to generate a Batch' do

  end
end
