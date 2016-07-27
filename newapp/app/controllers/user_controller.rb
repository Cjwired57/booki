require 'stripe'
class UserController < ApplicationController
  Stripe.api_key = "sk_test_LaGOwlDvqeTDlyYRBnWN1y4W"

  # def password
  #   @password ||= Password.new(password_digest)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_digest = @password
  # end
# users.password_hash in the database is a :string
def new
end

def create

  if request.xhr?
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      account = Stripe::Account.create({
        country: 'US',
        managed: true,
        default_currency: 'USD'
        })
      account_id = account.id
      s_key = account.keys.secret
      p_key = account.keys.publishable

      ManagedAccount.create(user_id: user.id, account_id: account_id, secret_key: s_key, publishable_key: p_key )

    else
     flash[:danger] = "Please enter a valid email and or password"
     redirect_to root_path
   end
 else
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
end


private

def user_params
  params.require(:user).permit(:email, :password)
end


end
