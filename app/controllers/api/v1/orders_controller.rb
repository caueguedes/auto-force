class Api::V1::OrdersController < ApplicationController
  before_action :set_orders, only: [:check_status]

  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def check_status
    render json: @order
  end

  def list
    binding.pry
    closing = 2
    @orders = Order.filter(params.slice(:status, :purchase_channel).with_defaults(status: closing))

    render json: @orders
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orders
      @order = Order.filter(params.slice(:reference, :client_name))
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:reference, :purchase_channel, :client_name, :address, :delivery_service, :total_value, :line_items)
    end
end