# frozen_string_literal: true

# Blogs controller
class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy toggle_status]
  before_action :set_sidebar_topics, except: %i[create update destroy toggle_status]
  layout 'blog'
  access all: %i[show index],
         user: { except: %i[toggle_status destroy new create edit update] },
         site_admin: :all

  def index
    @blogs = if logged_in?(:site_admin)
               Blog.order_blogs.page(params[:page]).per(10)
             else
               Blog.published.order_blogs.page(params[:page]).per(10)
             end

    @page_title = 'My Blog Post'
    @seo_keywords = 'Danielshow, Daniel Shotonwa, Programming, Articles, Rails, Javascript, GraphQL'
    @blog_url = request.url
    @blog_title = "DanielShow's Blog"
    @blog_content = "This is my Blog, I write to challenge myself on things I know and to give back to my community :)"
  end

  def show
    seo_optimization
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new
      @page_title = @blog.title
      @seo_keywords = strip_body(@blog.body, 180)
    else
      redirect_to blogs_path, notice: 'You are not authorized to view this page'
    end
  end

  def new
    @blog = Blog.new
  end

  def edit; end

  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html {  redirect_to blogs_url, notice: 'Blog was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    else
      @blog.draft!
    end
    redirect_to blogs_path, notice: 'Blog status has been updated'
  end

  private

  def seo_optimization
    @blog_url = request.url
    @blog_title = @blog.title
    @blog_content = strip_body(@blog.body, 180)
  end

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :topic_id, :status)
  end

  def set_sidebar_topics
    @set_sidebar_topics = Topic.with_blogs
  end

  def strip_body(body, number)
    body.body.to_plain_text[0...number]
  end


end
