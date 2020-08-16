module BatchValidator
  extend ActiveSupport::Concern

  included do
    validate :validate_has_orders
    before_validation :set_reference
    validates :reference, uniqueness: true
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
