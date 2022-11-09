module ApiRescues
    extend ActiveSupport::Concern
    included do
        rescue_from Doorkeeper::Errors::InvalidToken, with: :handle_doorkeeper_errors
        rescue_from Doorkeeper::Errors::TokenForbidden, with: :handle_doorkeeper_errors
        rescue_from Doorkeeper::Errors::TokenExpired, with: :handle_doorkeeper_errors
        rescue_from Doorkeeper::Errors::TokenRevoked, with: :handle_doorkeeper_errors
        rescue_from Doorkeeper::Errors::TokenUnknown, with: :handle_doorkeeper_errors
        rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
        def render_unprocessable_entity_response(exception)
          render json: exception.record.errors, status: :unprocessable_entity
        end
    
        def render_not_found_response(exception)
          render json: { error: exception.message }, status: :not_found
        end
      end
    
      protected
    
      def doorkeeper_unauthorized_render_options(error: nil)
        if error.nil?
          {
            json: {
              response_code: "custom.errors.doorkeeper_unauthorized_nil",
              response_message: doorkeeper_unauthorized_default_message,
            },
          }
        else
          {
            json: {
              response_code: "doorkeeper.errors.messages.#{error.name}.#{error.reason}",
              response_message: error.try(:description) || doorkeeper_unauthorized_default_message,
            },
          }
        end
      end
    
      private
    
      def doorkeeper_unauthorized_default_message
        if Rails.env.production?
          I18n.t("custom.errors.doorkeeper_unauthorized_nil")
        else
          "#{I18n.t("custom.errors.doorkeeper_unauthorized_nil")} - This should never show in prod"
        end
      end
    
      def add_default_response_keys
        @response_code ||= "custom.success.default"
        @response_message ||= I18n.t("custom.success.default")
      end
    
      def handle_doorkeeper_errors(exception)
        case exception
        when Doorkeeper::Errors::TokenExpired
          @response_code = "doorkeeper.errors.messages.invalid_token.expired"
          @response_message = I18n.t(@response_code)
        when Doorkeeper::Errors::TokenRevoked
          @response_code = "doorkeeper.errors.messages.invalid_token.revoked"
          @response_message = I18n.t(@response_code)
        when Doorkeeper::Errors::TokenUnknown
          @response_code = "doorkeeper.errors.messages.invalid_token.unknown"
          @response_message = I18n.t(@response_code)
    
        when Doorkeeper::Errors::InvalidToken, Doorkeeper::Errors::TokenForbidden
          @response_code = "doorkeeper.errors.messages.invalid_token.random_token"
          @response_message = I18n.t(@response_code)
        end
    
        render json: {
                 response_code: @response_code,
                 response_message: @response_message,
               }, status: 401
      end
    end
end