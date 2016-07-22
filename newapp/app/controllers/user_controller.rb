class UserController < ApplicationController

# users.password_hash in the database is a :string
  def new
  end

  def create
    @user = User.new(email: params[:email])
    @user.password=params[:password]

    @user.save
    redirect_to root_path
  end

end
