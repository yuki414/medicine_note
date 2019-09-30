class MedicinesController < ApplicationController
  
  before_action :require_login,  only: [:new, :showt, :update]
  PER=8
  def index
    # @medicines = Medicine.search(params[:search])
    @medicines = Medicine.search(params[:search]).
          page(params[:page]).per(PER)
    @user = current_user
  end
  
  def show
    @medicines = Medicine.find(params[:id])
  end
  
  def new
  end
  
  def edit
  end
  
  def update
  end
  
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @medicines = Medicine.search(params[:search])
  end
end
