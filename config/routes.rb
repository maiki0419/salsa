Rails.application.routes.draw do
  devise_for :customers

  root  'homes#top'
  get '/about' => 'homes#about'

  resources :customers, only: [:show, :edit, :update] do
    resource :relationships, only: [:create,:destroy]
    get :followers, on: :member
    get :followeds, on: :member
  end

  resources :teams do
    resources :schedules, only: [:index, :create, :destroy]
    resources :team_records, only: [:create, :destroy, :show, :edit, :update]
  end


  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :rooms, only: [:show, :destroy]
  resources :chats, only: [:create, :destroy]

  resources :notifications, only: [:index]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
