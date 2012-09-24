class UsersController < ApplicationController
  def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success]="user created"
			render :xml => 'notify', :status => 201
		else
			render :xml => 'cannot_create_user', :status => 406
		end
  end
end
