class MuseumsController < ApplicationController
	include MuseumsHelper
	RESULT_PER_PAGE = 10

	def index
		@museums=getMuseumsList
		params[:page].nil? ? page=0 : page=params[:page].to_i
		@museums=@museums[page*RESULT_PER_PAGE..page*RESULT_PER_PAGE+RESULT_PER_PAGE-1]		
		respond_to do |format|
			format.xml # index.xml.builder 
		end
	end
	def show
		@museum=getMuseum params[:id]
		respond_to do |format|
			format.xml { render 'shared/not_found', status: 404 if @museum.nil? }
		end
	end
end
