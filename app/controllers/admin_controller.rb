class AdminController < ApplicationController
  
  before_filter :admin_only!
  
  def index
    @users = User.all
    @sessions = User.find(:all, :conditions => 'current_sign_in_at IS NOT NULL')
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new
    @user.accessible = :all if is_admin?
    @user.attributes = params[:user]
    
    if @user.save
      redirect_to(admin_index_path)
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.accessible = :all if is_admin?
        
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    
    if @user.update_attributes(params[:user])      
      redirect_to(admin_index_path, :notice => 'User was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    
    if @user.destroy
      redirect_to(admin_index_path, :notice => 'User was successfully removed.')
    end
  end
  
end
