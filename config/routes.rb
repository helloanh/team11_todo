Rails.application.routes.draw do

  # get 'to_do_items/create'
  # get 'to_do_items/edit'
  # get 'to_do_items/destroy'

  resources  :users, :accounts

  resources :to_do_lists do
    resources :to_do_items, only: [:index, :create, :edit, :destroy, :show, :update, :new]
  end


  root to: "to_do_lists#index"


  # these routes are for manageming user authentication
  get '/login' => 'sessions#new'
  get '/show'  => 'accounts#show'
  get '/edit' => 'accounts#edit'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'


  get '/todo_lists/:id/edit' => 'to_do_lists#edit'
  get '/todo_lists/:id/new' => 'to_do_lists#new'
  get '/todo_lists/:id/show' => 'to_do_lists#show'

  get "to_do_list/:id/to_do_item/new" => "to_do_items#edit"
  get "to_do_list/:id/to_do_item/:id/new" => "to_do_items#new"
  get "to_do_list/:id/to_do_item/:id" => "to_do_items#show"



end
