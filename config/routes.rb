Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sessions, only: [:create]
  resources :users, only: [:create, :update, :show, :index]
  resources :fees, only: [:index]
  resources :reports, only: [:index, :show, :create, :update]
  resources :products, only: [:index, :update, :show]
  resources :manage_fba_invs, only: [:index]

  post '/requestReport', to: 'reports#request_report'
  post '/getReport', to: 'reports#get_report'

  get '/sessions', to: 'sessions#refresh'
  
  post '/topProducts/', to: 'products#get_top_products'
  
  get '/destroy', to: 'users#delete_user_and_products'
  get '/update_inventory', to: 'products#update_inventory'
  get '/load_report_to_database', to: 'reports#load_report_to_database'

  post '/reports_list_by_next_token', to: 'reports#reports_list_by_next_token'

  


end
