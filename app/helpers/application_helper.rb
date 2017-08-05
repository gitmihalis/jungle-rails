module ApplicationHelper
  def signed_in?
    User.find(session[:user_id]) if session[:user_id] 
  end
end
