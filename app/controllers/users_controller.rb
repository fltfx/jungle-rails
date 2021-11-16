class UsersController < ApplicationController
  def new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def authenticate_with_credentials(email, password)
    #check if user exists by checking email address
    checkUser = User.find_by_email(email)
    if checkUser && checkUser.authenticate(password)
      return checkUser
    else
      return nil
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
