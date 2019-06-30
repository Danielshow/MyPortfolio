# frozen_string_literal: true

# Topics controller
class TopicsController < ApplicationController
  before_action :set_sidebar_topics
  layout 'blog'
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @blogs = if logged_in?(:site_admin)
               @topic.blogs.order_blogs.page(params[:page]).per(10)
             else
               @topic.blogs.published.order_blogs.page(params[:page]).per(10)
             end
  end

  private

  def set_sidebar_topics
    @set_sidebar_topics = Topic.with_blogs
  end
end
