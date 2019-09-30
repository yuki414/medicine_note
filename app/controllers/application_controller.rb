class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include SessionPharmacistsHelper # Pharmacist用のログインセッション
  PER = 4 # ページネーション用、何個まで出すか
  
  private
  
  def require_login
    unless logged_in?
      flash[:warning] = "ログインする必要があります。"
      redirect_to login_path # halts request cycle
    end
  end
  
  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
  
  # 管理者かどうか確認
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
  # 薬剤師かどうか確認
  def require_pharmacist
    unless logged_in_ph?
      flash[:warning] = "薬剤師専用ページです"
      redirect_to root_url
    end
  end
  
  # 薬剤師またはユーザーであるかの確認
  def require_uop
    unless (current_user) || logged_in_ph?
      flash[:warning] = "ユーザーまたは薬剤師専用のページです"
      redirect_to root_url
    end
  end
end