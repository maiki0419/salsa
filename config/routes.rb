Rails.application.routes.draw do
  devise_for :customers

  root to: 'homes#top'
  get '/about' => 'homes#about'

  resources :customers, only: [:show, :edit, :update] do
    resources :relationships, only: [:create,:destroy]
    get :followers, on: :member
    get :followeds, on: :member
  end

  resources :teams do
    resources :schedules, only: [:index, :create, :destroy]
    resources :team_records, only: [:create, :destroy]
  end


  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :rooms, only: [:create, :show, :destroy]
  resources :chats, only: [:create, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
