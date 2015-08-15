class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @users = User.all
  end

  def edit
    @product = Product.find_by(id: params[:id])
    @users = User.all.map {|u| u.id}
  end

  def show
    @product = Product.find_by(id: params[:id])
    @title = @product.title
    @price = @product.price
    @description = @product.description
    @user = User.find_by(id: @product.user_id)
  end

  def create
    deal_params = params.require(:deal).permit(:title, :description, :price, :user_id)

    @product = Product.new(deal_params)

    redirect_to products_path if @product.save
  end

  def update
    product_params = params.require(:product).permit(:title,
                                                     :description,
                                                     :price,
                                                     :user_id)

    @product = Product.find_by(id: params[:id])
    redirect_to products_path if @product.update(product_params)
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    redirect_to products_path if @product.destroy
  end

end
