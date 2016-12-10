Rails.application.routes.draw do
  root 'food_stores#index'
  devise_for :users

  resources :food_stores do
    resources :food_items, only: [:create, :edit, :destroy]
  end
end
