class MedicineHistoriesController < ApplicationController
  
  before_action :require_login
  
  def index
    @medicine_histories = MedicineHistory.all
    # @medicine_histories = current_user.medicine_histories
    @medicines = Medicine.all
    @user = User.all
    @pharmacist = Pharmacist.all
  end
  
  def show
  end
  
  def new
    @medicine_histories = MedicineHistory.new
    # @medicine_histories.user_id = current_user.id
    # @medicine_histories.medicine_id = params[:mid]
    @medicine = Medicine.find(params[:mid])
  end
  
  def create
    @medicine_histories = MedicineHistory.new(mhis_params)
    @medicine_histories.user_id = current_user.id
    # uid = @medicine_histories.user_id
    if @medicine_histories.save
      redirect_to user_path(current_user.id)
    else
      render 
    end
  end
  
  private
  def mhis_params
    params.require(:medicine_history).permit(:date,
    :user_id, :pharmacist_id, :medicine_id, :adm, :dose)
  end
end
