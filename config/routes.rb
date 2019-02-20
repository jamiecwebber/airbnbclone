Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :apartments
  resources :bookings do
    resources :reviews, only: [:new, :create, :index]
  end

  root to: 'apartments#index'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
