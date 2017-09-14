class DeliveryAddressesController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])

    @delivery_address = @customer.delivery_addresses.create(delivery_address_params)

    redirect_to customer_path(@customer)
  end

  def destroy
    @customer = Customer.find(params[:customer_id])

    @delivery_address = @customer.delivery_addresses.find(params[:id])

    @delivery_address.destroy
    redirect_to customer_path(@customer)
  end

  private
  def delivery_address_params
    params.require(:delivery_address).permit(:name, :address, :phone_number)
  end
end
