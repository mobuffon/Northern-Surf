Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update] do
    resources :articles, only: [:index, :show, :new, :create, :edit, :update, :delete] do
      resources :comments, only: [:create, :update, :delete]
    end
  end
  get 'articles/index_all', to: 'articles#index_all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
