# frozen_string_literal: true

# Default parameter for views
module DefaultPageContent
  extend ActiveSupport::Concern
  included do
    before_action :set_title
  end

  def set_title
    @page_title = 'Danielshow || My Portfolio'
    @seo_keywords = 'Daniel Shotonwa Portfolio'
  end
end
