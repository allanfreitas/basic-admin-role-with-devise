class SessionsController < Devise::SessionsController
  
  skip_before_filter :kick_user_if_not_active
  
  def new
  end
  
end
