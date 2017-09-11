class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      session[:customer_id] =@customer.id
      redirect_to(:controller => 'products', :action => 'index')
    else
      render "new"
    end

  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update_attributes(customer_params)
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :phone_number)
  end

end
