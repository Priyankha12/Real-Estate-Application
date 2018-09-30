Rails.application.routes.draw do

  #devise_for :hunters
  resources :inquiries
  #resources :hunters
  resources :houses do
    collection do
      get :add_interest
    end
    collection do
      get :search
      get :find
    end
  end
  #resources :realtors, :path_prefix => 'my'

# devise_for :realtors, :controllers => { :registrations => 'realtors', :sessions => 'realtors' }

  devise_for :realtors, :controllers => {
      :registrations => "realtors/registrations",
      :sessions => "realtors/sessions",
     :passwords => "realtors/passwords",
      :confirmations => "realtors/confirmations",
      #:realtors => "realtors/realtors"
  }

  devise_for :hunters, :controllers => {
      :registrations => "hunters/registrations",
      :sessions => "hunters/sessions",
      :passwords => "hunters/passwords",
      :confirmations => "hunters/confirmations",
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


  end

  devise_scope :hunter do
    get 'sign_up', to: 'hunters/registrations#new'
    get 'sign_in' , to: 'hunters/sessions#new'
    delete 'sign_out', to: 'hunters/sessions#destroy'
    resources :hunters
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

  resources :hunters

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

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

