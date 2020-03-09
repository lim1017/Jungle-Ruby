class SessionsController < ApplicationController

  def new
  end

  def create
    

    user = User.authenticate_with_credentials(params[:email], params[:password])
    # If the user exists AND the password entered is correct.
    if user != nil
      session[:user_id] = user
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end


  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
