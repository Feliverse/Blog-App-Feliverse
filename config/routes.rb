Rails.application.routes.draw do
  root 'users#index'
   resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :likes, only: [:create]
      resources :comments, only: [:index, :show, :new, :create, :destroy]
    end
  end
end
