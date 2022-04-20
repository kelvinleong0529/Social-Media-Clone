class RegistrationsController < ApplicationController
    def new
        @user = User.new    # go look at the database tables in the "User" model and create a new instance
    end
    

    def create
        @user = User.new(user_params) # take the USER parameter from the FORM, and save the record into the "User" database
        if @user.save
            session[:user_id] = @user.id # grab the USER ID and assign it to the session after succcessfully saved in database
            redirect_to root_path, notice: "Successfully created account" # redirect to home page
        else
            render :new # this will go to App views registrations new.html.erb
        end
    end

    private

    def user_params
        params.require(:user).permit(:email,:password,:password_confirmation)
        # params is used to grab the parameters returned when the user make a POST request
        # params.require(:user) is the same as params.[:user], except the former 1 will raise error if user was not found
    end

end