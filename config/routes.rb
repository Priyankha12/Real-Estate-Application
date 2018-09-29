Rails.application.routes.draw do

  resources :inquiries
  resources :hunters
  resources :houses
  #resources :realtors, :path_prefix => 'my'

# devise_for :realtors, :controllers => { :registrations => 'realtors', :sessions => 'realtors' }

  devise_for :realtors, :controllers => {
      :registrations => "realtors/registrations",
      :sessions => "realtors/sessions",
     :passwords => "realtors/passwords",
      :confirmations => "realtors/confirmations",
      #:realtors => "realtors/realtors"
  }


  devise_scope :realtor do
    get 'sign_up', to: 'realtors/registrations#new'
    get 'sign_in' , to: 'realtors/sessions#new'
    delete 'sign_out', to: 'realtors/sessions#destroy'
    resources :realtors do
      member do
        get :realtor_houses
      end
    end
   # get '/realtors/:id', to: 'realtors#show', as: 'realtor'

    #get '/realtors/:id', to: 'realtors#show'

  end

  #authenticated :realtor do
   # resources :realtors , module: "realtors"
  #end
 # end
  #get '/realtors/:id' => 'realtors#show'

  resources :realtors do
    member do
      get :realtor_houses
    end
  end

  resources :houses do
    member do
      get :potential_hunters
    end
  end
  #get '/realtors', to: 'realtors#index'

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
