class UsersController < ApplicationController
	before_filter :authenticate, :only => [:show]

  def create
		@user = User.new(name: params[:name],email: params[:email],password: params[:password],password_confirmation: params[:password_confirmation])
		if @user.save
			return render_notify(201,:success,"user created")
		else
			return render 'cannot_create_user', :status => 406
		end
  end
	def show
	end

	def new
	end
end
