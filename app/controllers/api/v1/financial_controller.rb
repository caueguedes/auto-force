class Api::V1::FinancialController < ApplicationController

  def report
    report = Order.select('SUM(total_value) as total_value, COUNT(id) as total_orders', :purchase_channel)
                 .group(:purchase_channel).map { |order| order.as_json.except "id" }
    render json: report, status: :ok
  end
end
