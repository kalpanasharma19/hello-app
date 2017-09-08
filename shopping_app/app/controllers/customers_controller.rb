class CustomersController < ApplicationController
  #def index
    #render "new"
  #end
  def show
  end
  def new
    @customer = Customer.new
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

  #before_filter :save_login_state, :only => [:new, :create]

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :phone_number, :password, :password_confirmation)
  end
end
