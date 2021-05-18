class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @product = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    #binding.pry
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(products_params)
      #binding.pry
   redirect_to product_path
   else
   render :edit
   end
  end

  def destroy
    @product = Product.find(params[:id])
     @product.destroy
     redirect_to root_path
   end

  private

  def products_params
    params.require(:product).permit(:name, :details, :category_id, :condition_id, :ship_method_id, :prefecture_id, :day_ship_id,
                                    :price, :image).merge(user_id: current_user.id)
  end
end
