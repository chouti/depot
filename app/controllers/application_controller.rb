class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  
  private
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart=Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
