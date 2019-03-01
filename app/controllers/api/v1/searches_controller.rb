class Api::V1::SearchesController < ApplicationController    

    def search_products
    	@products = Product.where(nil)    	
    	@products = @products.where('lower(name) LIKE ? or lower(description) LIKE ?', "%#{params[:search].downcase}%", "%#{params[:search].downcase}%") if params[:search].present?
    	@products = @products.page(params[:page]).per(params[:limit]).order('id DESC')

    	render json: @products, meta: pagination_dict(@products)
    end

    def filter_products
    	@products = Product.where(nil)
        @products = @products.joins(:categories).where("categories.id IN (?)", params[:categories]) if params[:categories].present?
        @products = @products.where(product_brand_id:params[:brand_id]) if params[:brand_id].present?
        @products = @products.where('lower(products.name) LIKE ? or lower(products.description) LIKE ?', "%#{params[:search].downcase}%", "%#{params[:search].downcase}%") if params[:search].present?
        @products = @products.where(:price => params[:price_start]..params[:price_end]) if params[:price_start].present? and params[:price_end].present?
        @products = @products.page(params[:page]).per(params[:limit]).order('id DESC')
        
        render json: @products, meta: pagination_dict(@products)
    end

    def product_brands
        @product_brands = ProductBrand.all
        @product_brands = @product_brands.page(params[:page]).per(params[:limit]).order('id DESC')

        render json: @product_brands, meta: pagination_dict(@product_brands)
    end

end
