class UsersController < ApplicationController
  def index
    @users = User.all
  end
  # user画面表示
  def show
    @user = User.find(params[:id])
  end
  # user作成画面表示
  def new
    @user = User.new
  end
  # user作成処理
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    end
  end
  private
  def user_params
    params.require(:user).permit(:name)
  end
end
 