Rails.application.routes.draw do
  use_doorkeeper
  root "api/v1/users#index"
  devise_for :users, only: [:confirmations, :passwords, :users], controllers: { confirmations: "confirmations", passwords: "passwords" }
  
  namespace "api" do
    namespace "v1" do
      #devise
      post "register", to: "users#register"
      post "confirm", to: "users#confirm"
  
      post "login", to: "auth#login"
      post "refresh", to: "tokens#refresh"
      post "logout", to: "tokens#logout"


      #users
    end
  end

end
