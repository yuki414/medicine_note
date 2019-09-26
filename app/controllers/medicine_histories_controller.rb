class MedicineHistoriesController < ApplicationController
  def index
    @medicine_histories = MedicineHistory.all
    @medicines = Medicine.all
    @user = User.all
    @pharmacist = Pharmacist.all
  end
  
  def show
  end
  
  def new
  end

end
