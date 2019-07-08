# frozen_string_literal: true

# Pages controller
class PagesController < ApplicationController
  before_action :set_seo
  def home; end

  def contact; end

  def tech_news
    @technews = SocialTool.twitter_search
  end

  private

  def set_seo
    @seo_keywords = 'Daniel Shotonwa, Programming, Javascript, Ruby on Rails, Portfolio, Danielshow'
  end
end
