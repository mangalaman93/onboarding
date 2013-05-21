module UsersHelper
  def user_admin?
    current_user.is_admin?
  end
end