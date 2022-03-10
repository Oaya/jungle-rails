class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      sessoion[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).parmit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
  
end
