module Api
    class BaseController < ActionController::API
      include ApiRescues
      private
        class_eval do
            Devise.mappings.keys.each do |resource|
              define_method :"current_#{resource.to_s}" do
                if eval("@current_#{resource.to_s}.nil?")
                  eval("@current_#{resource.to_s}.nil?")
                  instance_variable_set(
                    "@current_#{resource.to_s}",
                    if doorkeeper_token
                      eval("#{resource.to_s.camelcase}.find(doorkeeper_token.resource_owner_id)")
                    else
                      warden.authenticate(scope: resource, store: false)
                    end
                  )
                else
                  eval("@current_#{resource.to_s}")
                end
              end
            end
          end
          
    end
  end