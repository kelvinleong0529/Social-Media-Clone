class PasswordResetsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email:params[:email])
        if @user.present? # check if user is present
            # send email
            PasswordMailer.with(user:@user).reset.deliver_later
            # go to the "Password" mailer and send the reset email
            # (@user) is the params here, to let the mailer know who should the mail be sent to
            # "reset" means it will call the "reset" method in "password_mailer.rb" under app > mailers
            # delvier later means to send the mail in background
            # "deliver_later" can be replaced by "deliver_now" that can make the email to be sent right away, but this will slow down the reponse in the browser
        else
        
        end

        redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password!"
        # we always redirect the user back to the root page regardless the user enter a valid email or password
    end

    def edit
        @user = User.find_signed(params[:token], purpose: "password_reset")
        # extract the token from the url
        # look up the user and make sure the token is not more than 15 minutes old
    end

    def update
    
    end

end