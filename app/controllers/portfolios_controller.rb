# frozen_string_literal: true

# Portfolio Controller
class PortfoliosController < ApplicationController
  before_action :set_portfolio, except: %i[new create index sort_portfolio]
  layout 'portfolios'
  access all: %i[show index],
         user: { except: %i[destroy edit create update new sort_portfolio] },
         site_admin: :all
  def index
    @portfolio_items = Portfolio.by_positiom
  end

  def sort_portfolio
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
    render body: nil
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def show; end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path,
                                notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    if @portfolio_item.update(portfolio_params)
      redirect_to portfolios_path
    else
      render 'edit'
    end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path,
                              notice: 'Portfolio was deleted successfully.' }
    end
  end

  private

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :thumb_image,
                                      :main_image,
                                      technologies_attributes: [:id, :name, :_destroy])
  end
end
