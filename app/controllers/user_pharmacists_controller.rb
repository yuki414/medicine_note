class UserPharmacistsController < ApplicationController
  def show
    @user_ph = current_user_ph
  end
end
