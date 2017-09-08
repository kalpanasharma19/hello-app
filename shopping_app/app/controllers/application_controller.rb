class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def authenticate_customer
    if session[:customer_id]
     # set current user object to @current_user object variable
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
  def name
  @customername = Customer.find(session[:customer_id]).name
  end

end
end
