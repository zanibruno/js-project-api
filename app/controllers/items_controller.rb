class ItemsController < ApplicationController

	def index
		trip = Trip.find_by(id: params[:trip_id])
		items = trip.items ? : trip.items = []
		render json: items
	end

	# def show 
	# 	trip = Trip.find_by(id: params[:trip_id])
	# 	item = trip.items
	# 	render json: item
	# end 


	def create 
		trip = Trip.find_by(id: params[:trip_id])
		item = Trip.items.build(item_params)
		if item.save
			render json: item
		else 
			flash.now[:error] = 'test create item'
		end
	end



	private 


	def item_params 
		params.require(:item).permit(:name, :quantity, :trip_id)
	end 
end
