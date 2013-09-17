class CommentsController < ApplicationController
	def new
		@product = Product.find(params[:product_id])
		@comment = Comment.new
	end

	def create
    	@product = Product.find(params[:product_id])
    	@comment = @product.comments.create(params[:comment])
    
    	redirect_to products_path(@product)
  	end

  	def index
	    @products = Product.includes(:comments)#loads all comments on one query. Eager loading
	    @categorys = Category.all
  	end
end