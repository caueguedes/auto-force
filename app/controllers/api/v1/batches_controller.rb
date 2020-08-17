class Api::V1::BatchesController < ApplicationController
  before_action :set_batch, only: [:produce, :close]

  def create
    response = BatchManager::CreateBatch.call(purchase_channel: batch_params)

    if response.success?
      render json: response.data, status: :created
    else
      render json: error(response.errors), status: :unprocessable_entity
    end
  end

  def produce
    binding.pry
    response = BatchManager::ProduceBatch.call(batch: @batch)

    if response.success?
      render json: response.data
    else
      render json: error(response.errors), status: :unprocessable_entity
    end
  end

  def close
    response = BatchManager::CloseBatchToDelivery.call(batch: @batch, delivery_service: delivery_param)
    binding.pry
    if response.success?
      render json: response.data
    else
      render json: error(response.errors), status: :unprocessable_entity
    end
  end

  private
    def set_batch
      @batch = Batch.find_by!(reference: require_reference)
    end

    def batch_params; params.require(:purchase_channel); end
    def delivery_param; params.require(:delivery_service); end
    def require_reference; params.require(:reference); end
end
