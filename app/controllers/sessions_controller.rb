class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_eamil(params[:id])
      # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
       session[:user_id] = user.id
      # logged in when they navigate around our website.  
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
