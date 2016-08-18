module Paginatable
  extend ActiveSupport::Concern

  included do
    scope :paginated, -> (params) do
      page(params[:page] || 1)
      .per(params[:per_page] || Kaminari.config.default_per_page )
    end
  end
end
