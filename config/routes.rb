Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web, at: "/sidekiq"


  root "landing#index"
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
      
      # company jobs 
      get "user/companies/jobs", to: "jobs_publisheds#index"
      get "user/companies/job_specific", to: "jobs_publisheds#company_specific_job"
      post "user/companies/jobs", to: "jobs_publisheds#create"
      post "user/companies/jobs/set_status", to: "jobs_publisheds#update_job_status"

      #search jobs
      get "user/search", to: "jobs_publisheds#search_job"
      get "user/jobfeed", to: "jobs_publisheds#job_feed"

    end
  end

end
