class PasswordsController < ApplicationController

    before_action :require_user_logged_in!

    def edit

    end

    def update
        if Current.user.update(password_params)
            redirect_to root_path, notice: "Password Updated"
        else
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
        # only extract the password and password confirmation for PASSWORD UPDATE
        # email is not required
    end

end