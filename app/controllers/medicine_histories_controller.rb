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
  end
  
  def create
    @medicine_histories = MedicineHistory.new(mhis_params)
    uid = @medicine_histories.user_id
    if @medicine_histories.save
      redirect_to mhis_path
    else
      render 'new'
    end
  end
  
  private
  def mhis_params
    params.require(:medicine_history).permit(:date, :user_id,
    :pharmacist_id, :medicine_id, :adm, :dose)
  end
end
