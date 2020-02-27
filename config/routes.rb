Rails.application.routes.draw do

	devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    member do
  get :following, :followers
   end
   collection do
    get 'search' => 'searchs#search'
  end
end
  root 'home#top'
  get 'home/about' => 'home#about'

  resources :books do
  resource :favorites, only: [:create, :destroy]
  resource :book_comments, only: [:create, :destroy]

  end
end
