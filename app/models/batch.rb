class Batch < ApplicationRecord
  has_many :orders, autosave: true

  include BatchValidator

  def produce
    orders.update(status: :closing)
  end

  def close(delivery_service)
    orders.where(delivery_service: delivery_service).each {| order|  order.sent!}
  end

  def change_status_published_to_production
    orders.update status: :production  #if orders.first.published?
  end
end
# https://makandracards.com/alexander-m/39365-generate-unique-random-token