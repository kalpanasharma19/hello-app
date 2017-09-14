class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @customer = current_customer
  end

  def create
    @customer = current_customer

    @order = @customer.orders.create(order_params)

    current_customer.shopping_cart_items.each do |item|
      order_item = OrderItem.new
      order_item.order = @order
      order_item.product_id = item.product.id
      order_item.price = item.product.price
      order_item.quantity = item.quantity
      order_item.save
      item.destroy
    end

    if @order.save
      flash[:success] = "Order confirmed!"
      redirect_to products_path
    end
  end

  def destroy
    @order = current_customer.orders.find(params[:id]) rescue nil
    @order.destroy
    render 'show'
  end

  private
  def order_params
    params.require(:order).permit(:delivery_address_id)
  end
end
