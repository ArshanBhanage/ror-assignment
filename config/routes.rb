Rails.application.routes.draw do
  resources :appointments
  resources :patients

  namespace :receptionist do
    get 'dashboard', to: 'receptionists#dashboard', as: 'dashboard'
    get 'add_appointment', to: 'receptionists#add_appointment', as: 'add_appointment'
    get 'add_patient', to: 'receptionists#add_patient', as: 'add_patient'
    # get 'get_contacts', to: 'user_actions#get_contacts'
  end

  namespace :doctor do
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
