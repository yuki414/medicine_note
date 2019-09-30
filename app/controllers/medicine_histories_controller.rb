class MedicineHistoriesController < ApplicationController
  
  # before_action :require_login
  before_action :require_uop, only: [:show, :new, :create, :edit, :update]
  
  def index
  end
  
  def show
    @mhis = MedicineHistory.find(params[:mh_id])
  end
  
  def new
    @mhis = MedicineHistory.new
    @mhis.medicine_id = (params[:m_id])
  end
  
  def create
    @mhis = MedicineHistory.new(mhis_params)
    # if current_user
      @mhis.user_id = current_user.id
    # elsif params[:id].present?
      # @mhis.user_id = (params[:u_id])
    # end
    if @mhis.save
      redirect_to user_path(current_user.id)
    else
      flash[:danger]="無効な入力です。"
      m_id=mhis_params[:medicine_id]
      redirect_to new_medicine_history_path(:m_id => m_id)
    end
  end
  
  def edit
    @mhis = MedicineHistory.find(params[:mh_id])
  end
  
  def update
    @mhis = MedicineHistory.find(params[:id])
    if @mhis.update_attributes(mhis_params)
      flash[:success] = "お薬情報を修正しました"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    MedicineHistory.find(params[:id]).destroy
    flash[:success] = "お薬の記録を削除しました"
    if current_user
      redirect_to current_user
    elsif current_user_ph
      redirect_to medicine_history_pharmacist_path
    end
  end
  
  private
  def mhis_params
    params.require(:medicine_history).permit(:date,
    :pharmacist_id, :medicine_id, :adm, :dose)
  end
end
