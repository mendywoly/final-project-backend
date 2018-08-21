class UsersController < ApplicationController
    before_action :requires_login

    def index
        render json: current_user_a
    end

    def show 
        user = User.find(params[:id])
        render json: user
    end

    def update
        current_user_a.update(user_params)        
        render json: current_user_a
    end

    # def create
    #     user = User.create(first_name: params[:firstName], last_name: params[:lastName], username: params[:userName], password: params[:password])
    #     #added this function to show off app without, temp to be deleted
    #     if user.valid?
    #         load_random_data(user)
    #     end

    #     if user.valid?
    #         render json: {
    #             user: user,
    #             token: get_token(payload( user.first_name, user.id ))
    #         }
    #     else
    #         render json: user.errors.messages, status: :unathorized
    #     end    
    # end

    def delete_user_and_products
        current = current_user_a
        current.products.destroy_all
        current.destroy
        render json: {message: 'Goodbye'}
    end

   
    private

    def user_params
        params.require(:body).permit(:first_name, :last_name, :username, :password)
    end


end
