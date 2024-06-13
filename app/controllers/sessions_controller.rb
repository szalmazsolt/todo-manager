class SessionsController < ApplicationController

  def new
    
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_todo_path(@user), notice: "You have logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render :new, status: :unauthorized
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, status: :see_other, notice: "You have logged out!"
  end

end