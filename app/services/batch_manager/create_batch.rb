module BatchManager
  class CreateBatch < ApplicationService
    def initialize(purchase_channel:)
      @batch = Batch
      @batch.purchase_channel = purchase_channel
    end

    def call
      set_orders_to_batch
      return Error(@batch.errors) unless @batch.valid?

      save_batch
      @batch.orders = update_orders_status
      Success @batch
    end

    private
      def purchase_channel; @batch.purchase_channel; end
      def save_batch;  @batch.save; end

      def set_orders_to_batch
        @batch.orders = Order.where(purchase_channel: purchase_channel)
                            .where(batch_id: nil).published
      end

      def update_orders_status
        Order.where(batch_id: @batch.id).lock.update(status: :production)
      end
  end
end
