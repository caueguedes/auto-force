module Pagination
  extend ActiveSupport::Concern

  private
    def paginate(entity)
      entity_data = entity.page(@page).per(@per_page)
      paginated_hash(entity_data, entity_data.total_pages)
    end

    def paginated_hash(entity_data, total_pages)
      {
          data: entity_data,
          pagination: {
            current_page: @page,
            per_page: @per_page,
            total_pages: total_pages
        }
      }
    end

    def set_paginate_params
      @page = params[:current_page] || 1
      @per_page = params[:per_page] || 10
    end
end
