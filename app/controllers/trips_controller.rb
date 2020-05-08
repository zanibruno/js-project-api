class TripsController < ApplicationController

	def index 
		options = {include: :items}
		trips = Trip.all 
		render json: trips.to_json(:include => {:items => { :only => [:name, :quantity, :trip_id]}})
		# trips.to_json(:include => {:items => { :only => [:name, :quantity, :trip_id]}})
		
	end 	

	def show
		trip = Trip.find_by(id: params[:id])
		if trip
			render json: TripsSerializer.new(trip)
		else 
			flash.now[:error] = 'test show trip'
		end 
	end 

	def create
		trip = Trip.new(trip_params)
		if trip.save
			render json: trip
		else 
			flash.now[:error] = 'test create'
		end 
	end 

	def update 
		@trip = Trip.find_by(id: params[:id])
		@trip.update(trip_params)
		render json: @trip

	end 





	private 

	def trip_params 
		params.require(:trip).permit(:country)
	end




end
