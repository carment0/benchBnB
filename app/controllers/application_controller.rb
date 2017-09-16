class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_login?
  
  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def is_login?
    !!current_user
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    if is_login?
      current_user.reset_session_token!
      session[:session_token] = nil
    end
  end

end
