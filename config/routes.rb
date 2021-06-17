Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:show, :index,:update,:edit]
  # post 'books' => 'books#create'
  # delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  # patch 'books/:id' => 'books#update', as: 'update_book'
end
