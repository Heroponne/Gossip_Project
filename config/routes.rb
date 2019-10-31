Rails.application.routes.draw do
  
  get '/profile', to: 'welcome#profile'
  get '/welcome/:user_entry', to: 'welcome#show_index'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  resources :gossips do
  	resources :comments
  end
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]

end
