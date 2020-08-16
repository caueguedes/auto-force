class Api::V1::BatchesController < ApplicationController
  before_action :set_batch, only: [:produce, :close]

  def create
    response = BatchManager::CreateBatch.call(purchase_channel: batch_params)

    if response.success?
      render json: response.data, status: :created
    else
      render json: response.errors, status: :unprocessable_entity
    end
  end

  def produce
    response = BatchManager::ProduceBatch.call(batch: @batch,
                                               delivery_service: params.require(:delivery_service))
    if response.success?
      render json: response.data
    else
      render json: response.errors, status: :unprocessable_entity
    end
  end

  def close
    response = BatchManager::CloseBatchToDelivery.call(close_params)
    if response.success?
      render json: response.data
    else
      render json: response.errors, status: :unprocessable_entity
    end
  end

  private
    def set_batch
      @batch = Batch.filter(params.slice(:reference))
    end

    def batch_params; params.require(:purchase_channel); end
    def close_params; params.slice(:reference, :delivery_channel); end
    def produce_params; params.slice(:reference); end
end
