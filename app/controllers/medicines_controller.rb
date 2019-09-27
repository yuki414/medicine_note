class MedicinesController < ApplicationController
  def index
    @medicines = Medicine.search(params[:search])
    # @medicines = Medicine.paginate(page: params[:page], per_page: 5).search(params[:search])
  end
  
  def show
    @medicines = Medicine.find(params[:id])
  end
  
  def new
  end
  
  
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @medicines = Medicine.search(params[:search])
  end
end
