Rails.application.routes.draw do
  

  
  get 'meetings/new'
  get 'meetings/list_meetings'
  post 'meetings/create'
  get 'meetings/show/:meeting_id' => 'meetings#show', as: 'meeting_show'

  get 'users/list_user'
  get 'users/new_user'

  post 'users/create'

  patch 'users/update_user/:user_id' => 'users#update_user', as: 'update_user'

  get 'users/get_user/:user_id' => 'users#get_user', as: 'get_user'

  delete 'users/delete_user/:user_id' => 'users#delete_user', as: 'user_delete'

  root 'home#index'
  devise_for :users, :controllers =>{ registrations: 'registrations',  :sessions => "sessions"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
