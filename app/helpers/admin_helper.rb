module AdminHelper
  def editing_myself?
    true if @user.id == current_user.id
  end
end