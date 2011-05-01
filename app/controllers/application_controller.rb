class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_timezone
  before_filter :authenticate_user!
  #before_filter :kick_user_if_not_active, :unless => :devise_controller?
  before_filter :kick_user_if_not_active
  
  helper_method :is_admin?, :is_active?
  
  def set_timezone
    Time.zone = 'Pacific Time (US & Canada)'
  end
  
  protected
    
  def is_admin?
    current_user.is_admin?
  end
  
  def is_active?
    current_user.is_active?
  end
  
  def admin_only!
    redirect_to(root_path) unless is_admin?
  end
  
  def kick_user_if_not_active
    unless current_user && is_active?
      reset_session
      redirect_to(new_user_session_path, :alert => 'Your account is disabled.')
    end
  end
  
end
