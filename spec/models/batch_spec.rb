require 'rails_helper'

RSpec.describe Batch, type: :model do
  context 'without enough orders' do
    it 'rejects the batch as invalid' do
      expect(build(:batch)).to_not be_valid
    end
  end

  context 'with enough orders' do
    before(:each) do
      create(:order, purchase_channel: 'Other site')
      @batch = build(:batch)
      @batch.orders= create_list(:order, 3)
      @batch.save
    end

    it 'creates a valid Batch' do
      expect(@batch).to be_valid
      expect(Order.where(batch_id: @batch).count).to be_eql 3
    end
  end
end
