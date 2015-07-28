helpers do

  def login(user)
    session[:id] = user.id
  end

  # def logout!
  #   session[:id] = nil
  # end

  def current_user
    if session[:id]
      @current_user ||= User.where(id: session[:id]).first
    else
      session[:id] = nil
    end
  end

  def logged_in?
    !!current_user
  end

  def is_coach?
    !!current_user.admin
  end

  def debug(message)
    p '*' * 100
    p message
    p '*' * 100
  end

end