Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items,only: [:index, :new, :update, :create, :show, :edit, :destroy] do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  resources :purchase
  resources :addresses
end

