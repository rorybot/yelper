Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :restaurants do
    resources :ratings
  end

  root 'welcome#index'
end
