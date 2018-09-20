Rails.application.routes.draw do
  resources :inquiries
  resources :hunters
  resources :houses
  resources :realtors
  resources :real_estate_companies
  resources :admins
  root 'admins#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
