class CustomersController < ApplicationController
  before_action :authenticate_customer, only: [:show]
  before_action :save_login_state, only: [:new, :create]

  def index
    if is_admin?
      @customers = Customer.all
    else
      @customer = current_customer
      render 'show'
    end
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
      redirect_to products_path
    else
      render "new"
    end

  end

  def update
    @customer = Customer.find_by(params[:id])
    if @customer.update_attributes(customer_params)
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def destroy
    @customer = Customer.find_by(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :phone_number, :password, :password_confirmation)
  end

end
