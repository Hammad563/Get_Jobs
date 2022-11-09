Rails.application.routes.draw do
  root "api/v1/users#index"
  devise_for :users, only: [:confirmations, :passwords, :users], controllers: { confirmations: "confirmations", passwords: "passwords" }
  
  namespace "api" do
    namespace "v1" do
      #devise
      post "register", to: "users#register"
      post "confirm", to: "users#confirm"
  
      post "login", to: "auth#login"
      post "refresh", to: "auth#refresh"
      post "logout", to: "auth#logout"

      #profile
      get "user/profile", to: "profiles#index"
      post "user/profile_update", to: "profiles#update_profile"
      post "user/profile/create_role", to: "profiles#create_role"
      post "user/profile/create_exp", to: "profiles#create_work_exp"
      post "user/profile/create_education", to: "profiles#create_education_params"
      #profile update
      put "user/profile/update_role", to: "profiles#update_role"
      put "user/profile/update_education", to: "profiles#update_work_exp"
      put "user/profile/update_exp", to: "profiles#update_education"

      #delete role,education/exp
      post "user/profile/delete_role", to: "profiles#delete_role"
      post "user/profile/delete_education", to: "profiles#delete_education"
      post "user/profile/delete_exp", to: "profiles#delete_work_exp"

      # companies
      get "user/companies", to: "companies#index"
      post "user/companies", to: "companies#create_company"
      


    end
  end

end
