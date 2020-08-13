class Batch < ApplicationRecord
  has_many :orders, autosave: true

  before_validation :set_orders_to_batch, on: :create
  before_validation :validate_has_orders, on: :create
  before_validation :set_reference
  validates :reference, uniqueness: true
  after_save :change_status_published_to_production

  def produce
    orders.update(status: :closing)
  end

  def close(delivery_service)
    orders.where(delivery_service: delivery_service).each {| order|  order.sent!}
  end

  def change_status_published_to_production
    orders.update status: :production  #if orders.first.published?
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
# https://makandracards.com/alexander-m/39365-generate-unique-random-token