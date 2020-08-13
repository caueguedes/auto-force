class Api::V1::BatchesController < ApplicationController
  before_action :set_batch, only: [:produce, :close]

  # POST /batches
  def create
    @batch = Batch.new(purchase_channel: params[:purchase_channel])

    if @batch.save
      render json: @batch, status: :created
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # PUT /batches/:reference/produce
  def produce
    if @batch.produce
      render json: @batch
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # PUT /batches/:reference/close
  def close
    if @batch.close
      render json: @batch
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:reference])
    end

    # Only allow a trusted parameter "white list" through.
    def batch_params
      params.require(:batch).permit(:reference, :purchase_channel)
    end
end
