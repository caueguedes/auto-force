class Order < ApplicationRecord
  belongs_to :batch, optional: true, default: nil
  enum status: { published: 0, production: 1, closing: 2, sent: 3}

  include Filterable

  scope :filter_by_status, -> (status){ where(status: status) }
  scope :filter_by_purchase_channel, -> (purchase_channel){ where(purchase_channel: purchase_channel) }
  scope :filter_by_reference, -> (reference){ where(purchase_channel: reference) }
  scope :filter_by_client_name, -> (client_name){ where(client_name: client_name) }

  validates :reference, uniqueness: true
  validates_presence_of :address, :client_name, :delivery_service, :line_items, :purchase_channel, :reference
  validates :total_value, numericality: { greater_than_or_equal_to: 0}
end
