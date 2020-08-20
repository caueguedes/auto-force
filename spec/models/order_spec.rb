require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'with a valid order' do
    let!(:order) {create(:order)}
    it 'creates a order record' do
      expect(order).to be_valid
    end

    context 'try to creates a order with a duplicated reference' do
      it 'rejects the order as invalid' do
        order2 = build(:order, reference: order.reference)
        expect(order2).to_not be_valid
      end
    end
  end

  context 'with an invalid order' do
    context 'when the order lacks a reference' do
      it 'rejects the order as invalid' do
        expect(build(:order, reference:nil)).to_not be_valid
      end
    end

    context 'when the order lacks a purchase_channel' do
      it 'rejects the order as invalid' do
        expect(build(:order, purchase_channel:nil)).to_not be_valid
      end
    end

    context 'when the order lacks client_name' do
      it 'rejects the order as invalid' do
        expect(build(:order, client_name:nil)).to_not be_valid
      end
    end

    context 'when the order lacks address' do
      it 'rejects the order as invalid' do
        expect(build(:order, address:nil)).to_not be_valid
      end
    end

    context 'when the order lacks delivery_service' do
      it 'rejects the order as delivery_service' do
        expect(build(:order, client_name:nil)).to_not be_valid
      end
    end

    context 'when the order lacks total_value' do
      it 'rejects the order as invalid' do
        expect(build(:order, total_value:nil)).to_not be_valid
      end
    end

    context 'when the order has a total value smaller than zero' do
      it 'rejects the order as invalid' do
        expect(build(:order, total_value:-10)).to_not be_valid
      end
    end

    context 'when the order has a status not in the interval of 0 end 4' do
      it 'rejects the order as invalid' do
        expect { build(:order, status:5) }.to raise_error ArgumentError
        expect { build(:order, status:-1) }.to raise_error ArgumentError
      end
    end
  end
end