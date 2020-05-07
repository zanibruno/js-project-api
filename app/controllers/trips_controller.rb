class TripsController < ApplicationController

	def index 
		trips = Trip.all 
		render json: TripSerializer.new(trips)
	end 	

	# def show 
	# 	trip = Trip.find_by(id: params[:id])
	# 	render json: trip
	# end 

	def create
		trip = Trip.new(trip_params)
		if trip.save
			render json: TripSerializer(trip) 
		else 
			flash.now[:error] = 'test create'
		end 
	end 

	def update 
		@trip = Trip.find_by(id: params[:id])
		if @trip
		@trip.update(trip_params)
	else 
		flash.now[:error] = 'test update'
		end 
	end 





	private 

	def trip_params 
		params.require(:trip).permit(:country)
	end




end
