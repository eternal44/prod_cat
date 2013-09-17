class ProductsController < ApplicationController
  def index
    @products = Product.includes(:comments)#loads all comments on one query. Eager loading
    @categorys = Category.all
    @comments = Comment.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product]) 

      if @product.save
        redirect_to products_path, :notice => "New Product created"
      else
        render "new"#renders the new page
      end
  end

  def edit
    @product = Product.find(params[:id])

  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to products_path, :notice => "Product udpated"
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_url 
  end

end


