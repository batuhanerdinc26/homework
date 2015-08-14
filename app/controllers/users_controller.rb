class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    user_params = params.require(:user).permit(:username,
                                               :email,
                                               :age,
                                               :city)
    @user = User.new(user_params)

    redirect_to users_path if @user.save
  end

  def update
    user_params = params.require(:user).permit(:username,
                                               :email,
                                               :age,
                                               :city)
    @user = User.find(params[:id])

    redirect_to users_path if @user.update(user_params)
  end

  def destroy
    @user = User.find(params[:id])

    redirect_to users_path if @user.destroy
  end
end
