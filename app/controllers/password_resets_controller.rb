class PasswordResetsController < ApplicationController
  before_action :redirect_if_signed_in
  before_action :set_user_by_token, only: [:edit, :update]
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      PasswordMailer.with(
        user: user,
        token: user.generate_token_for(:password_reset)
      ).password_reset.deliver_later
    end
    redirect_to root_path, notice: "Please check your email to reset your password."
  end

  def edit
  end

  def update
    if @user.update(password_params)
      redirect_to new_session_path, notice: "Your password has been reset to something totally secure, I assume. Please sign in at your leisure."
    else 
      render :edit, status: :unprocessable_entity
    end

  end

  private 

  # Redirects signed-in users to edit_password_path.
  def redirect_if_signed_in
    redirect_to edit_password_path, 
      alert: "Use this form to update your password." if user_signed_in?
  end

  def set_user_by_token
    @user = User.find_by_token_for(:password_reset, params[:token])
    
    redirect_to new_password_reset_path alert: "Invalid token. Please try again." unless @user.present?
  end

end