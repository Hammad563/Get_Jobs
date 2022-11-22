class UserAlertMailer < ApplicationMailer
    default from: "noreply.customers@getjobs.ca"

    def new_user_mail(user)
        @user = user
        mail(to: @user.email, subject: "Welcome to Get Jobs!")
    end

end