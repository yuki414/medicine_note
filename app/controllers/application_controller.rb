class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include SessionPharmacistsHelper # Pharmacist用のログインセッション
  
  private
  
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
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
end
