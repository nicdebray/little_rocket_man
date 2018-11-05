Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources: rockets
  resources: users, only: [:show] do
    resources: bookings, except: [:edit, :update]
    resources: renters, only: [:new, :create, :show]
    resources: owners, only: [:new, :create, :show]
  end
end
