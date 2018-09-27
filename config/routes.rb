Rails.application.routes.draw do

  resources :inquiries
  resources :hunters
  resources :houses
  #resources :realtors

#  devise_for :realtors, :controllers => { :registrations => 'realtors', :sessions => 'realtors' }

  devise_for :realtors, :controllers => {
      :registrations => "realtors/registrations",
      :sessions => "realtors/sessions",
      :passwords => "realtors/passwords",
      :confirmations => "realtors/confirmations"
  }


  devise_scope :realtors do
    get 'sign_up', to: 'realtors/registrations#new'
    get 'sign_in' , to: 'realtors/sessions#new'
    delete 'sign_out', to: 'realtors/sessions#destroy'
   # get '/realtors/:id', to: 'realtors/sessions#show', as: 'show_realtor_path'

end
 # end
  resources :realtors

  resources :real_estate_companies
  resources :admins
  root 'admins#index'
  resources :realtors do
    member do
      get :realtor_houses
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
