Rails.application.routes.draw do
  
  get '/welcome/:user_entry', to: 'welcome#show_index'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/author/:user_id', to: 'welcome#show_author', as: 'author'
  resources :gossips

end
