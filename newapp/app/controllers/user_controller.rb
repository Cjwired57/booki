class UserController < ApplicationController

# users.password_hash in the database is a :string
  def new
  end

  def create
    p "*****"*50
    user = User.new(user_params)
    p user
    p "*****"*50
    if user.save
      flash[:success] = "registration successful"
      session[:user_id] = user.id
      redirect_to root_path
    else
       flash[:danger] = "Please enter a valid email and or password"
      redirect_to '/user/new'
    end
  end


private

  def user_params
    params.require(:user).permit(:email, :password)
  end


end