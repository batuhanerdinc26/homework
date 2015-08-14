class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @products = Product.all.map {|p| p.title}
    @users = User.all.map {|u| u.username}
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    product_params = params.require(:product).permit(:title,
                                                     :description,
                                                     :price)

    @product = Product.new(product_params)

    redirect_to products_path if @product.save
  end

  def update
    product_params = params.require(:product).permit(:title,
                                                     :description,
                                                     :price)

    @product = Product.find(params[:id])
    @product.update(product_params)
  end

  def destroy
    @product = Product.find(params[:id])
    redirect_to products_path if @product.destroy
  end
end
