module BatchManager
  class CloseBatchToDelivery < ApplicationService
    def initialize(batch:, delivery_service:)
      @batch = batch
      @delivery_service = delivery_service
    end

    def call
      return Error.new "No orders with delivery service: #{@delivery_service} to be produced." unless orders_with_delivery_service?

      @batch.orders.where(delivery_service: @delivery_service).closing.lock.update(status: :sent)

      Success.new @batch
    end

      private
        def orders_with_delivery_service?
          Order.where(batch_id: @batch, delivery_service: @delivery_service).closing.any?
        end
  end
end
