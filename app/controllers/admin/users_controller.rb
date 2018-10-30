class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
    return redirect_to admin_users_path if @user.update(user_params)
    flash.now[:error] = 'Не удалось обновить пользователя!'
    render 'edit'
  end

  def create
    @user = User.new(user_params)

    return redirect_to admin_users_path if @user.save
    flash.now[:error] = 'Не удалось создать пользователя!'
    render 'new'
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
