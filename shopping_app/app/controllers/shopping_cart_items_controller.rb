class ShoppingCartItemsController < ApplicationController
  def show
    @customer = current_customer
  end

  def create
    selected_product = Product.find(params[:product_id])

    if current_customer.products.include?(selected_product)
      @shopping_cart_item = current_customer.shopping_cart_items.find_by(product_id: selected_product)

      @shopping_cart_item.quantity += 1 unless @shopping_cart_item.quantity.blank?
    else
      @shopping_cart_item = current_customer.shopping_cart_items.new

      @shopping_cart_item.product = selected_product
      @shopping_cart_item.quantity = 1
    end

    if@shopping_cart_item.save
      redirect_to shopping_cart_items_show_path
    else
      render 'new'
    end
  end

  def add_quantity
    @shopping_cart_item = ShoppingCartItem.find(params[:id])

    @shopping_cart_item.quantity += 1

    @shopping_cart_item.save
    redirect_to shopping_cart_items_show_path
  end

  def reduce_quantity
    @shopping_cart_item = ShoppingCartItem.find(params[:id])

    @shopping_cart_item.quantity -= 1 if @shopping_cart_item.quantity > 1

    @shopping_cart_item.save
    redirect_to shopping_cart_items_show_path
  end

  def destroy
    @item = current_customer.shopping_cart_items.find(params[:id])

    @item.destroy
    redirect_to shopping_cart_items_show_path
  end
end
