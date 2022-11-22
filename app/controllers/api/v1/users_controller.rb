class Api::V1::UsersController < Api::BaseController
    def register
        user = User.new(register_params)
        user.save
        if user.persisted?
            @res = "devise.confirmations.send_instructions"
            @res_msg = I18n.t("devise.confirmations.send_instructions")
            render json: {
                response_code: @res,
                response_message: @res_msg
            }, status: 200
        else
            @res = "custom.errors.devise.registrations"
            @res_msg = user.errors.full_messages.to_sentence
            render json: {response_code: @res, response_message: @res_msg}, statu: 400
        end
    end

    def confirm
        user = User.confirm_by_token(confirm_params[:confirmation_token])
        if user.errors.empty?
            render status: 200
        else
            render json: {response_code: "custom.errors.devise.confirmations", response_message: user.errors.full_messages.to_sentence}, status: 400
        end
    end

    private
    def register_params
        params.permit(:email, :password, :name)
    end

    def confirm_params
        params.permit(:confirmation_token)
    end

end
