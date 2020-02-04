Rails.application.routes.draw do
  resources :submissions
  
  resources :courses do 
    resources :assignments
    resources :enrollments
  end 
  resources :assignments, except: :index 
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#welcome'
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end 
end
