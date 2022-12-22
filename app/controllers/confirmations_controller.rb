class ConfirmationsController < Devise::ConfirmationsController
    private
  
    def after_confirmation_path_for(resource_name, resource)
      # sign_in(resource) # In case you want to sign in the user
      # your_new_after_confirmation_path
      # "http://www.kinme.ca/auth/login"
      "localhost:3002/auth/"
    end
  end
  