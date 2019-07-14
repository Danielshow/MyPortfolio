class SitemapsController < ApplicationController
  def index
    @host = "#{request.protocol}#{request.host}"
    @blogs = Blog.all
    @portfolios = Portfolio.all
    @topics = Topic.all
  end
end
