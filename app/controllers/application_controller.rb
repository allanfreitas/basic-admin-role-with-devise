class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_user!, :is_active?
  
  helper_method :is_admin?
  
  protected
    
  def is_admin?
    current_user.is_admin?
  end
  
  def admin_only!
    redirect_to root_path unless is_admin?
  end
  
  def is_active?
    unless current_user && current_user.is_active?
      reset_session 
      redirect_to(new_user_session_path, :alert => 'Your account is disabled.')
    end
  end
  
end
