class Order < ApplicationRecord
  include Filterable
  include OrderValidator

  belongs_to :batch, optional: true, default: nil

  enum status: { published: 0, production: 1, closing: 2, sent: 3}

  scope :filter_by_status, -> (status){ where(status: status) }
  scope :filter_by_purchase_channel, -> (purchase_channel){ where(purchase_channel: purchase_channel) }
  scope :filter_by_reference, -> (reference){ where(reference: reference) }
  scope :filter_by_client_name, -> (client_name){ where(client_name: client_name) }
end
