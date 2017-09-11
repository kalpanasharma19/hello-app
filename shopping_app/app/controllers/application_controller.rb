class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :is_admin?

  def is_admin?
    Customer.find(session[:customer_id]).customer_role?
  end

  protected
  def authenticate_customer
    if session[:customer_id]
     # set current customer object to @current_customer object variable
      @current_customer = Customer.find session[:customer_id]
      return true
    else
      redirect_to(:controller => 'sessions', :action => 'new')
      return false
    end
  end
  def save_login_state
    if session[:customer_id]
      redirect_to(:controller => 'products', :action => 'index')
      return false
    else
      return true
  end

end
end
