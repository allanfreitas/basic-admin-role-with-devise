module AdminHelper
  def if_editing_myself?
    @user.id == current_user.id
  end
end
