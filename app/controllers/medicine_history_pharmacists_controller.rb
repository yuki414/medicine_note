class MedicineHistoryPharmacistsController < ApplicationController
  before_action :require_pharmacist
  
  PER=8
  def index
  end
  def show
    @user = User.find(params[:id])
    @mhis = @user.medicine_histories.order(date: "DESC")
        .page(params[:page]).per(PER)
    @sefe = @user.side_effects
    @medicines = Medicine.search(params[:search]).
          page(params[:page]).per(PER)
  end
  def new
    
  end
  
  
end
