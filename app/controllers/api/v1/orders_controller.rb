class Api::V1::OrdersController < ApplicationController
  include Pagination

  before_action :set_paginate_params, only: [:check_status, :list]

  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created
    else
      render json: error(@order.errors), status: :unprocessable_entity
    end
  end

  def check_status
    order = Order.filter(status_params)
    render json: paginate(order)
  end

  def list
    @orders = Order.filter(list_params)
    render json: paginate(@orders)
  end


  private
    def order_params
      params.require(:order).permit(:reference, :purchase_channel, :client_name, :address, :delivery_service, :total_value, :line_items)
    end

    def status_params
      return params.permit(:client_name, :reference) unless params.slice(:client_name, :reference).empty?
      raise ActionController::ParameterMissing.new("reference")
    end

    def list_params
      params.slice(:status, :purchase_channel).with_defaults(status: 2)
    end
end
