module Pagination
  extend ActiveSupport::Concern

  def set_paginate_params
    @page = params[:current_page] || 1
    @per_page = params[:per_page] || 10
  end

  private
    def paginate(entity)
      collection = entity.page(@page).per(@per_page)
      return { data: "No Records Found" } if collection.empty?

      { data:  collection }.merge( pagination_hash( collection.total_pages ) )
    end

    def pagination_hash(total_pages)
      {
          pagination: {
            current_page: @page,
            per_page: @per_page,
            total_pages: total_pages
        }
      }
    end
end
