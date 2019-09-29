class UsersController < ApplicationController
  
  before_action :require_login, only: [:show, :edit, :update]
  before_action :correct_user,  only: [:show, :edit, :update]
  
  def show
    @mhis = current_user.medicine_histories.order(:date).limit(2).reverse
    @user = current_user
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    # user_paramsを渡してセーブ成功すれば
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # 更新に成功した場合を扱う。
    else
      render 'edit'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
