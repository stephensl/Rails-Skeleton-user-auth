class SessionsController < ApplicationController
  def new

  end
  
  def create
    user = User.authenticate_by(session_params)
    
    if user
      redirect_path = login(user)
      Rails.logger.debug
      redirect_to redirect_path, notice: "You are now signed in."
    else 
      Rails.logger.debug
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end 
  end
  

  def destroy
    logout
    redirect_to new_session_path, notice: "You have been logged out."
  end

  private

  def session_params 
    params.permit(:email, :password)
  end
end