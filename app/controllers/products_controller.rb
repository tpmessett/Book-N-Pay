class ProductsController < ApplicationController
before_action :authenticate_user!

  def index
    @products = Product.where(user: current_user)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save && params[:formsrc] == "booking"
      @product.id
    elsif @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :formsrc)
  end

end
