class UsersController < ApplicationController

  def index
    @users = User.order(:name, :email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url, notice: "User #{@user.email} was successfully created."
    else
      render :new
    end
  end 

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) 
      redirect_to users_url, notice: "User #{@user.email} was successfully updated." 
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
     redirect_to users_url, notice: 'User was successfully destroyed.' 
  end


  private 

  def user_params
    params.require(:user).permit([:name, :email, :password, :password_confirmation])
  end
end

