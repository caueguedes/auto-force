class Api::V1::BatchesController < ApplicationController

    def set_batch
      financial_report = 'fuckinquery'

      render json: financial_report, status: :

    end
end
