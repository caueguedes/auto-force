module BatchManager
  class CreateBatch < ApplicationService
    def initialize(purchase_channel:)
      @batch = Batch.new
      @batch.purchase_channel = purchase_channel
    end

    def call
      set_orders_to_batch
      return Error.new @batch.errors unless @batch.save
      update_orders_status
      Success.new @batch
    end

    private
      def set_orders_to_batch
        @batch.orders = Order.where(purchase_channel: @batch.purchase_channel).where(batch_id: nil).published
      end

      def update_orders_status
        Order.where(batch_id: @batch.id).lock.update(status: :production)
      end
  end
end
