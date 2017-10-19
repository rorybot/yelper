Rails.application.routes.draw do
  get 'welcome/index'

  resources :restaurants do
    resources :ratings
  end

  root 'welcome#index'
end
