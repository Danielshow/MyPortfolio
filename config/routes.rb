Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id' => 'portfolios#show', as: 'portfolio_show'
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
