Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "home/about"=>"homes#about"
  
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get "follows" => "relationships#follows", as:"follows"
    get "followers" => "relationships#followers", as:"followers"
  end

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy] 
    resource :favorites, only: [:create, :destroy]
  end 

  get "search" => "searches#search"
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end 
