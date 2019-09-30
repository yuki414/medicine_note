module SessionPharmacistsHelper
    
  # 薬剤師用のログイン周り
  def log_in_ph(user_ph)
    session[:user_ph_id] = user_ph.id
  end

  # 薬剤師のログインidを返す
  def current_user_ph
    if session[:user_ph_id]
      # 短絡評価なため一番はじめのtrueが採用される
      # ~ current||User.find(hoge) current==false→User.find採用 current==true→current
      @current_user_ph ||= UserPharmacist.find_by(id: session[:user_ph_id])
    end
  end
  
  
  # 薬剤師でログインしているかどうか
  def logged_in_ph?
    !current_user_ph.nil?
  end
  
  # 現在選択している患者を選ぶ
  # def current_user
  #   if logged_in_ph?
  #     @current_user ||= User.find_by(id: params[:id])
  #   end
  # end
    
  # 現在のユーザーをログアウトする
  def logout_ph
    session.delete(:user_ph_id)
    @current_user_ph = nil
  end
  
end
