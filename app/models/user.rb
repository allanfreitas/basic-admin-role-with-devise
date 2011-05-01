class User < ActiveRecord::Base
    
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessor :accessible
  
  private
  
  def mass_assignment_authorizer
    if accessible == :all
      self.class.protected_attributes
    else
      super + (accessible || [])
    end
  end
  
end
