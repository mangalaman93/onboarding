module SessionsHelper
	def sign_in(user)
		cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user || user_from_remember_token
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		cookies.delete(:remember_token)
		self.current_user = nil
	end

	def store_location
		session[:return_to] = request.fullpath
	end

	def deny_access
		store_location
		redirect_to signin_path, :flash => {:type => "info",
	    											 						:message => "Please login to access to access this page!" }
	end

	def authenticate
		deny_access unless signed_in?
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session[:return_to] = nil
	end

	def current_user?(user)
	    user == current_user
	end

	def correct_user(user_id)
	    @user = User.find(user_id)
	    redirect_to(root_path, :flash => {:type => "info",
	    											 				 		:message => "You are not allowed to access this page!" }) unless current_user?(@user)
	end

	def admin_only_access(user_id)
    redirect_to(user_path(user_id), :flash => { :type => "info",
	    																					:message => "You are not allowed to access this page!" }) unless current_user.is_admin
  end

	private
	def user_from_remember_token
		User.authenticate_with_salt(*remember_token)
	end

	def remember_token
		cookies.signed[:remember_token] || [nil, nil]
	end
end
