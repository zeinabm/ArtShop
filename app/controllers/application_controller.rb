class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def cart_items
    Item.where(:user => current_user, :status => "order")
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :lastname, :phone, :email, :address, :store_id, :avatar, :role, :password, :password_confirmation,
                                                            :store_attributes => [:name, :firstname, :lastname, :city, :bank, :account_owner, :account]) }

  end

end
