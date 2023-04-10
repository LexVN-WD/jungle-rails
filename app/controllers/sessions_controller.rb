class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    # If user exists & password entered is correct
    # User ID is saved inside the browser cookie
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end