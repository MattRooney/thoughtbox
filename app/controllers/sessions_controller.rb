class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash.now[:error] = "Invalid password. Try again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:logout] = "Goodbye!"
    redirect_to login_path
  end

end
