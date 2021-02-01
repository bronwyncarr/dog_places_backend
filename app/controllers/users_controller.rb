class UsersController < ApplicationController
  def create
    # create user from user params
    @user = User.create(user_params)

    if @user.save
      # Deliver the signup email
      UserNotifierMailer.send_signup_email(@user).deliver
      auth_token = Knock::AuthToken.new payload: { sub: @user.id }
      render json: { username: @user.username, jwt: auth_token.token }, status: :created

    else

      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def sign_in
    @user = User.find_by_email(params[:user][:username])
    # #checks there is a user and that they have entered the right password based on bcrypts encryption.

    if @user && @user.authenticate(params[:user][:password])
      auth_token = Knock::AuthToken.new payload: { sub: @user.id }
      render json: { username: @user.username, jwt: auth_token.token }, status: 200
    else
      render json: { error: 'Incorrect Email or Password' }, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :auth)
  end
end
