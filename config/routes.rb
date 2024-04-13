Rails.application.routes.draw do
  resources :appointments
  resources :patients  

  get 'upcoming', to: 'appointments#upcoming', as: 'upcoming_appointments'
  get 'past_appointments/:patient_id', to: 'appointments#past_appointments', as: 'past_appointments'

  namespace :receptionist do
    get 'dashboard', to: 'receptionists#dashboard', as: 'dashboard'
    # get 'get_contacts', to: 'user_actions#get_contacts'
  end

  namespace :doctor do
    get 'dashboard', to: 'doctors#dashboard', as: 'dashboard'
    # post 'add_phone_to_spam', to: 'user_actions#add_phone_to_spam'
    # get 'get_contacts', to: 'user_actions#get_contacts'
  end


  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'
end
