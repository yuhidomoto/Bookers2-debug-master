Rails.application.routes.draw do

	 devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  root 'home#top'
  get 'home/about' => 'home#about'

  resources :book, only: [:new, :create, :index, :show] do
  resource :favorites, only: [:create, :destroy]
  resource :book_comments, only: [:create, :destroy]

  end
end
