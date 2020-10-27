module SessionsHelper
    
  def log_in(user)
      session[:user_id] = user.id
  end

  def current_user?(user)
    user == current_user
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil  
   end

   def only_loggedin_users
    redirect_to login_url unless logged_in?
  end

  def require_admin
    unless current_user.administrator?
      redirect_to root_path
    end
  end

  def is_admin?
  end

end
