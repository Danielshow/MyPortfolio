# frozen_string_literal: true

# Blogs controller
class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy toggle_status]
  layout 'blog'
  access all: %i[show index],
         user: { except: %i[toggle_status destroy new create edit update] },
         site_admin: :all

  def index
    @blogs = Blog.order(:created_at).page(params[:page]).per(10)
    @page_title = 'My Blog'
  end

  def show
    @page_title = @blog.title
    @seo_keywords = @blog.title
  end

  def new
    @blog = Blog.new
  end

  def edit; end

  def create
    @blog = Blog.new(blog_params)
    @blog.topic_id = 2
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

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
