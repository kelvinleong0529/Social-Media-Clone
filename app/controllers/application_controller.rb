class ApplicationController < ActionController::Base

    before_action :set_current_user
    # before rails run any other action, rendering the main.html.erb, run the set_current_user function FIRST

    def set_current_user
        if session[:user_id] # check is there is any USER ID in this session
            Current.user = User.find_by(id: session[:user_id]) # if yes then look up the database user with the USER ID value, find_by will not throw error if the user does not exist
        end
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil?
        # redirect the user to sign in if they are not signed-in
    end

end