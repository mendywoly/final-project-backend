class FeesController < ApplicationController
    before_action :requires_login


    def index
        fees = current_user_a.fees
        render json: fees
    end
end
