class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url, status: :see_other
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You have successsfully signed up!"
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "You have successsfully updated your profile!"
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "You have successsfully deleted your account!"
    redirect_to root_url, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
