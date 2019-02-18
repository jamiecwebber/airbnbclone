Rails.application.routes.draw do
  resources :users do
    resources :apartments
    resources :bookings
  end

  root to: 'apartments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
