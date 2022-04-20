class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password]) # the authenticate method comes from USER model has_secure_password
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successful"
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end
end