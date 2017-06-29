class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private
  def confirm_logged_in
  	if session[:user_id].nil?
  		flash[:notice] = "Please login now"
  		redirect_to(access_login_path)

  	end
  end
end
