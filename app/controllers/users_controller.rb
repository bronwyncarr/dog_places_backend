# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    # create user from user params
    @user = User.create(user_params)

    if @user.save
      # Deliver the signup email
      UserNotifierMailer.send_signup_email(@user).deliver
      # gves the user an auth token, may need to remove this
      auth_token = Knock::AuthToken.new payload: { sub: @user.id }
      render json: { username: @user.username, jwt: auth_token.token }, status: :created

    else

      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def sign_in
    @user = User.find_by_username(params[:user][:username])
    # #checks there is a user and that they have entered the right password based on bcrypts encryption.

    if @user&.authenticate(params[:user][:password])
      # auth token here allows the user access to the site
      auth_token = Knock::AuthToken.new payload: { sub: @user.id }
      # send back username and auth token to react so they can be stored in state and local storage respectivly, the is admin boolean is sent back for React protected routes
      render json: { username: @user.username, jwt: auth_token.token, is_admin: @user.is_admin }, status: 200
    else
      render json: { error: 'Incorrect Email or Password' }, status: 404
    end
  end

  def destroy
    @user.destroy
    render json: { notice: 'Your account has been deleted' }, status: 201
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password,  :auth)
  end
end
