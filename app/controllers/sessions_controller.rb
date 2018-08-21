class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:userName])
        if (user && user.authenticate(params[:password]))
            render json: {
                username: user.username,
                id: user.id,
                token: get_token(payload( user.first_name, user.id ))
            } 
        else
            render json: { Error: "Wrong Message" }, status: :unathorized
        end
    end


    def refresh
        if requires_login
            render json: { good: "Good Message" }, status: 200
        else
            render json: { Error: "Wrong Message" }, status: :unathorized
        end
    end


end
