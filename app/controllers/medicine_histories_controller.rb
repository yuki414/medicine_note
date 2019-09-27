class MedicineHistoriesController < ApplicationController
  
  before_action :require_login
  
  def index
    # @medicine_histories = current_user.medicine_histories
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
    @mhis.user_id = current_user.id
    if @mhis.save
      redirect_to user_path(current_user.id)
    else
      redirect_to new_medicine_history_path
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
    flash[:success] = "User deleted"
    redirect_to current_user
  end
  
  private
  def mhis_params
    params.require(:medicine_history).permit(:date,
    :user_id, :pharmacist_id, :medicine_id, :adm, :dose)
  end
end
