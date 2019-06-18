# frozen_string_literal: true

# Pages controller
class PagesController < ApplicationController
  def home
    @post = Blog.all
    @skills = Skill.all
  end

  def about; end

  def contact; end
end
