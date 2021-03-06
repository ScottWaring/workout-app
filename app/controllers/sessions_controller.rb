class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(name: params[:session][:name])
    # byebug
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:error] = "Invalid Username/Password Combination"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to :new
  end

end
