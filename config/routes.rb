Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'users/new'
  # get 'news/index'
  root 'news#index'
  get 'news', to: 'news#index', as: 'allnews'
  get  '/about', to: 'static_pages#about'
  get  '/newcomments', to: 'comments#index'
  get  '/submit', to: 'news#new'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # changes below made when implementing item model
  resources :users, only: %i[new create]
  resources :news, except: :index, path: '/item' do
    resources :comments, only: %i[create]
  end

  resources :sessions, only: %i[new create] do
    delete :destroy, on: :collection
  end

  # api routes
  namespace :api do
    namespace :v0 do
      post '/item/create', to: 'items#create'
      resources :items, only: %i[index show], path: '/item'
    end
  end
end
