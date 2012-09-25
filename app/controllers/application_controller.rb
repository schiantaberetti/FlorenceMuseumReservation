class ApplicationController < ActionController::Base
  protect_from_forgery

	def render_notify(status,key,desc)
		flash[key]=desc
		render 'shared/notify', status: status 
	end
	def authenticate
		authenticate_or_request_with_http_basic do |email, password|
    	@current_user = User.find_by_name(email)
			@current_user.authenticate(password) if @current_user
  	end
	end
end
