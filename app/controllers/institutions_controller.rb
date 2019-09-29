class InstitutionsController < ApplicationController
    before_action :require_login
    before_action :admin_user
end
