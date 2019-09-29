class SessionPharmacistsController < ApplicationController
  def new
  end
  
  def create
    user_ph = UserPharmacist.find_by(email: params[:session][:email].downcase)
    if current_user
      flash.now[:warning] = "すでにユーザーとしてログインしています。ログアウト後、薬剤師としてログインしてください。"
      render 'new'
    elsif user_ph && user_ph.authenticate(params[:session][:password])
      log_in_ph user_ph
      flash[:success] = "ログインしました。"
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      redirect_to user_ph
    else
      # エラーメッセージを作成
      flash.now[:danger] = 'メールアドレスまたはパスワードが無効です。'
      render 'new'
    end
  end
  
  def destroy
    log_out_ph
    redirect_to root_url
  end
end
