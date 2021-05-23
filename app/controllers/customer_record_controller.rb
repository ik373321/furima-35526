class CustomerRecordController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_product, only: [:index, :create]
  before_action :sold_out_product, only: [:index,:create]
  before_action :current_user_product_user, oniy: [:index,:create]
 
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

  if @order.valid?
    pay_item
    @order.save
    redirect_to root_path
  else
    render 'index'
  end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :block, :binding, :mobile).merge(token: params[:token],
                                                                                                        product_id: params[:product_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_product

    redirect_to root_path if @product.record.present?
  end

  def current_user_product_user
   
    return redirect_to root_path if current_user.id == @product.user.id
  end
end

def set_product
  @product = Product.find(params[:product_id])
end


