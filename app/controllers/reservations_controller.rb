class ReservationsController < ApplicationController
	include MuseumsHelper
	before_filter :authenticate

	def index
		@reservations=slice_page(@current_user.reservations)
		#respond_to (:xml)
	end
	
	def show
		return render_notify(401,:error,"not allowed") unless @current_user.reservation_ids.include?(params[:id].to_i)		
		@reservation=Reservation.find(params[:id].to_i)
	end
	
	def create
		return render_notify(406,:error,'museum not available') unless getMuseumsList.include? params[:museum]
		@reservation = @current_user.reservations.new(museum: params[:museum],date: params[:date],num_of_people: params[:num_of_pipl])
		if @reservation.save
			return render_notify(201,:success,"reservation created")
		else
			return render 'cannot_create_reservation', :status => 406
		end
	end
	
	def destroy
		return render_notify(401,:error,"not allowed") unless @current_user.reservation_ids.include?(params[:id].to_i)		
		@reservation=Reservation.find(params[:id].to_i)
		@current_user.reservations.delete @reservation
		return render_notify(200,:success,"reservation deleted")
	end
end
