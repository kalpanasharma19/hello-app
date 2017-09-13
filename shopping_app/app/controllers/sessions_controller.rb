class SessionsController < ApplicationController
  before_action :authenticate_customer, :only => [:show]
  before_action :save_login_state, :only => [:new,:create]

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
      redirect_to products_path
    else
      render "new"
    end
  end

  def destroy
  session.destroy
  render 'new'
  end

end
