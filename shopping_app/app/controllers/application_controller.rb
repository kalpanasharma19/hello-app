class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :is_admin?, :current_customer

  def current_customer
    Customer.find(session[:customer_id])
  end

  def is_admin?
    current_customer.customer_role?
  end

  protected
  def authenticate_customer
    if session[:customer_id]
     # set current customer object to @current_customer object variable
      @current_customer = Customer.find session[:customer_id]
      return true
    else
      redirect_to new_session_path
      return false
    end
  end

  def save_login_state
    if session[:customer_id]
      redirect_to products_path
      return false
    else
      return true
  end

end
end
