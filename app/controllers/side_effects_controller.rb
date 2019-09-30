class SideEffectsController < ApplicationController
  def new
    @sefe = SideEffect.new
  end

  def show
  end

  def create
    @sefe = SideEffect.new(sefe_params)
    @sefe.user_id = current_user.id
    if @sefe.save
      redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end
  
  private
  def sefe_params
    params.require(:side_effect)
      .permit(:medicine_id, :name, :description)
  end
end