module BatchManager
  class ProduceBatch < ApplicationService
    def initialize(batch:)
      @batch = batch
    end

    def call
      orders = Order.where(batch_id: @batch).production
      orders.lock.update(status: :closing)
      Success @batch.orders = orders
    end
  end
end
