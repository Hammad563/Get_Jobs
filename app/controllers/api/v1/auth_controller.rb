class Api::V1::AuthController < Doorkeeper::TokensController


    def login
        user = User.find_for_database_authentication(email: params[:email])
        case 
        when user.nil? || !user.valid_password?(params[:password])
            render json: {response_code: "devise.failure.invalid", response_message: "invalid password"} 
        else
            create
        end
    end

end

module Doorkeeper
    module OAuth
      class ErrorResponse
        # overwrite, do not use default error and error_description key
        def body
          {
            response_code: "doorkeeper.errors.messages.#{name}",
            response_message: description,
            state: state,
          }
        end
      end
    end
  end


module Doorkeeper
    module OAuth
      class TokenResponse
        def body
          {
            # copied
            "access_token" => token.plaintext_token,
            "token_type" => token.token_type,
            "expires_in" => token.expires_in_seconds,
            "refresh_token" => token.plaintext_refresh_token,
            "scope" => token.scopes_string,
            "created_at" => token.created_at.to_i,
            # custom
            response_code: "custom.success.default",
            response_message: "Successfully logged in",
          }.reject { |_, value| value.blank? }
        end
      end
    end
  end