class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_product,only: [:edit, :show, :update, :destroy]
  before_action :current_user_product_user, except: [:index, :new, :create, :show]

  
  def index
    @product = Product.order('created_at DESC')
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
   
  end


  def edit
  
    
  end

  def update
    
    if @product.update(products_params)
   redirect_to product_path
   else
   render :edit
   end
  end

  def destroy
    @product.destroy
     redirect_to root_path
   end


  private

  def products_params
    params.require(:product).permit(:name, :details, :category_id, :condition_id, :ship_method_id, :prefecture_id, :day_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  
  def current_user_product_user
    if current_user.id != @product.user.id || @product.record.present?
      redirect_to action: :index
    end
  end

  def set_product
    @product = Product.find(params[:id])
 end

end