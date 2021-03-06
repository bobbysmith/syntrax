Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # root to: "home#index"

  resources :users, except: [:edit, :update]
  resources :songs do
    member { post :vote }
  end


  CodeJam::Application.routes.draw do
    get "/auth/:provider/callback" => "sessions#create"
    get "/signout" => "sessions#destroy", :as => :signout
    get "/login", to: "users#login"
    root to: "songs#index"
  end
end
