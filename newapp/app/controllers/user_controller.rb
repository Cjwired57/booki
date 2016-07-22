class UserController < ApplicationController

# users.password_hash in the database is a :string
  def new
  end

  def create
    @user = User.new(email: params[:email])
    @user.password=params[:password]
    @user.save

    session[:current_user_id] = @user.id
    redirect_to root_path
  end




end
