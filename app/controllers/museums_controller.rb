class MuseumsController < ApplicationController
	include MuseumsHelper

	def index
		@museums=getMuseumsList
				@museums = slice_page(@museums)
	#	respond_to do |format|
#			format.xml # index.xml.builder 
#		end
	end
	def show
		@museum=getMuseum params[:id]
#		respond_to do |format|
#			format.xml { render 'shared/not_found', status: 404 if @museum.nil? }
#		end
	end
end
