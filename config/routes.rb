Rails.application.routes.draw do
  get 'reservations/index'
  #get 'rooms/index'
  #get 'rooms/show'
  #get 'rooms/new'
  root 'rooms#top'
  get 'users/account', to: 'users#show'
  get 'users/profile', to: 'users#profile_show'
  get 'users/profile/edit', to: 'users#profile_edit'
  put 'user/profile', to: 'users#profile_update'

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  resources :rooms do
    collection do
      get 'search'
    end
  end

  resources :reservations, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
