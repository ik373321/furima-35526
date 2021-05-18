class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, except: [:index, :show]
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
    @product = Product.find(params[:id])
  end

  private

  def products_params
    params.require(:product).permit(:name, :details, :category_id, :condition_id, :ship_method_id, :prefecture_id, :day_ship_id,
                                    :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
