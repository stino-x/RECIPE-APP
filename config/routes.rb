Rails.application.routes.draw do
  resources :users

  resources :recipes do
    member do
      patch 'toggle_public'
    end
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :foods do
    resources :inventory_foods
  end

  resources :inventories do
    get 'shopping_list', on: :member
    resources :inventory_foods
  end

  get '/public_recipes', to: 'recipes#public_index', as: 'public_recipes'

  # Additional routes...

  get "up" => "rails/health#show", as: :rails_health_check
end
