
class SessionsController < ApplicationController

    def new
    end

    def create
        # Log in
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            # Sessions
            #https://guides.rubyonrails.org/action_controller_overview.html#session
            session[:user_id] = user.id  

            flash[:notice] = "Logged in successfully"
            redirect_to user
        else
            flash.now[:alert] = "You entered an incorrect email or password"
            render 'new' 
        end
    end

    def destroy
        # Log out
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end

end
