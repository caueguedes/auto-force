module BatchValidator
  extend ActiveSupport::Concern

  included do
    before_validation :set_orders_to_batch, on: :create
    before_validation :validate_has_orders, on: :create

    before_validation :set_reference
    validates :reference, uniqueness: true

    after_save :change_status_published_to_production
  end

  def set_orders_to_batch
    self.orders= Order.where(purchase_channel: self.purchase_channel).published
  end

  def validate_has_orders
    errors.add(:orders, ", not enough orders to create a batch") if orders.empty?
  end

  def set_reference
    self.reference = generate_reference
  end

  def generate_reference
    loop do
      reference = SecureRandom.hex(6)
      break reference unless Batch.where(reference: reference).exists?
    end
  end
end
