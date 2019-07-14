# frozen_string_literal: true

Rails.application.routes.draw do
  get '/about' => 'about#index'
  get 'topics/index'
  get 'topics/show'
  get '/sitemap' => 'sitemaps#index'
  resources :topics, only: %I[index show]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  put 'portfolios/sort' => 'portfolios#sort_portfolio'
  resources :portfolios, except: [:show]
  get 'portfolio/:id' => 'portfolios#show', as: 'portfolio_show'
  get '/contact' => 'pages#contact'
  get '/tech-news' => 'pages#tech_news'
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  root to: 'pages#home'
end
