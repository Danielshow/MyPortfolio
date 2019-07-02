# frozen_string_literal: true

# Pages controller
class PagesController < ApplicationController
  def home; end

  def about
    @skills = Skill.all
  end

  def contact; end

  def tech_news
    @technews = SocialTool.twitter_search
  end
end
