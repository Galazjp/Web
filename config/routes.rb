Rails.application.routes.draw do
  resources :reviews, :pets, :locations, :types, :topics,  :comments, :users
  devise_for :users, path: '', path_names:{ sign_in: 'login',  sign_out: 'logout', sessions: ''}
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
