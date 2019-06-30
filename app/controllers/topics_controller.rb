# frozen_string_literal: true

# Topics controller
class TopicsController < ApplicationController
  layout 'blog'
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @topics = Topic.all
    @blogs = if logged_in?(:site_admin)
               @topic.blogs.order_blogs.page(params[:page]).per(10)
             else
               @topic.blogs.published.order_blogs.page(params[:page]).per(10)
             end
  end
end
