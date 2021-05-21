class CustomerRecordController < ApplicationController
  before_action :sold_out_product, only: [:index]
  def index
   #binding.pry
    @product = Product.find(params[:product_id])
    
   # binding.pry
    @order = Order.new
  end

  def create
    @product = Product.find(params[:product_id])
    #binding.pry
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit( :postal_code, :prefecture_id, :city, :block, :binding, :mobile, ).merge(token: params[:token], product_id:params[:product_id], user_id:current_user.id)
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @product.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end


  def sold_out_product
    @product = Product.find(params[:product_id])
    if @product.record.present?    
      redirect_to root_path 
    end
  end
end
