module BatchManager
    class CloseBatchToDelivery < ApplicationService
        def initialize(batch:, delivery_service:)
            @batch = batch
            @delivery_service = delivery_service
        end

        def call
            orders = Order.where(batch_id: @batch, delivery_service: @delivery_service).closing
            orders.lock.update(status: :closing)
            @batch.orders = orders
            Success.new @batch
        end
    end
end
