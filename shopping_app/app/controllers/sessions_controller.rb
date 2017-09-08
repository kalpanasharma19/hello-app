class SessionsController < ApplicationController
  def index
      render "new"
  end
  def show
  end

  def new
  end
  def create
    authorized_customer = Customer.authenticate(params[:username],params[:login_password])
    if authorized_customer
      session[:customer_id] = authorized_customer.id
      redirect_to(:controller => 'products', :action => 'index')
    else
      render "new"
    end
  end


  #before_filter :authenticate_customer, :only => [:show]
  #before_filter :save_login_state, :only => [:new,:create]

  def destroy
  session[:customer_id] = nil
  redirect_to action: 'new'
  end

end
