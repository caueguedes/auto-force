module BatchManager
  class ProduceBatch < ApplicationService
    def initialize(batch:)
      @batch = batch
    end

    def call
      return Error.new 'no orders with status production.' unless orders_on_production?
      @batch.orders.production.lock.update(status: :closing)
      Success.new @batch
    end

    private
      def orders_on_production?
        @batch.orders.production.any?
      end
  end
end
