Filminuto::Application.routes.draw do
  
  authenticated :user do
    root :to => 'pages#index'
  end
  
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  resources :users do
    resources :videos
  end 

  root :to => "pages#index"
end
