class ApplicationController < ActionController::Base
  protect_from_forgery
	RESULT_PER_PAGE = 10

	def render_notify(status,key,desc)
		flash[key]=desc
		render 'shared/notify', status: status 
	end
	def slice_page(vector)
		params[:page].nil? ? page=0 : page=params[:page].to_i
		vector[page*RESULT_PER_PAGE..page*RESULT_PER_PAGE+RESULT_PER_PAGE-1]
	end
	def authenticate
		authenticate_or_request_with_http_basic do |email, password|
    	@current_user = User.find_by_name(email)
			@current_user.authenticate(password) if @current_user
  	end
	end
end
