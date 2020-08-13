module Pagination
  extend ActiveSupport::Concern

  class_methods do
    private
      def paginate(entity)
        binding.pry
        entity_data = entity.page(@page).per(@per_page)

        paginated_hash(entity_data, page, collection.total_pages)
      end

      def paginated_hash(entity_data, current_page, total_pages)
        binding.pry
        {
            data: entity_data,
            pagination: {
              current_page:  current_page,
              per_page: per_page,
              pages:    total_pages
          }
        }
      end

      def set_paginate_params
        binding.pry

        @page = params[:current_page] || 1
        @per_page = params[:per_page] || 10
      end
  end
end
