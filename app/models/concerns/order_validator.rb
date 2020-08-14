module OrderValidator
  extend ActiveSupport::Concern

  included do
    validates :reference,         uniqueness: true
    validates :reference,         presence: true
    validates :address,           presence: true
    validates :client_name,       presence: true
    validates :delivery_service,  presence: true
    validates :purchase_channel,  presence: true
    validates :line_items,        presence: true
    validates :total_value, numericality: { greater_than_or_equal_to: 0}
  end
end