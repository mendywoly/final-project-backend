class ProductsController < ApplicationController
    before_action :requires_login

    def index
        products = current_user_a.products
        render json: products
    end

    def update
        product = Product.find(params[:id])
        product.update(product_params)
        render json: product
    end

    def show
        product = Product.find(params[:id])
        render json: product
    end

    def get_top_products
        case params[:range]
        when 'units_shipped_last_24_hrs'
            top_products = current_user_a.products.order(units_shipped_last_24_hrs: :desc).limit(10)
        when 'units_shipped_last_7_days'
            top_products = current_user_a.products.order(units_shipped_last_7_days: :desc).limit(10)
        when 'units_shipped_last_30_days'
            top_products = current_user_a.products.order(units_shipped_last_30_days: :desc).limit(10)
        when 'units_shipped_last_90_days'
            top_products = current_user_a.products.order(units_shipped_last_90_days: :desc).limit(10)
        when 'units_shipped_last_180_days'
            top_products = current_user_a.products.order(units_shipped_last_180_days: :desc).limit(10)
        when 'units_shipped_last_365_days'
            top_products = current_user_a.products.order(units_shipped_last_365_days: :desc).limit(10)
        else
            top_products = current_user_a.products.order(units_shipped_last_24_hrs: :desc).limit(10)
        end
        render json: top_products
    end

    def update_inventory
        mskus = current_user_a.products.where(on_inv_management: true).pluck(:msku)
        mskus.each_slice(50) do |mskus_fifty|
            Product.update_inventory(mskus_fifty)
        end
        render json: current_user_a.products.where(on_inv_management: true)
    end

    private 

    def product_params
        params.require(:body).permit!
    end


end

