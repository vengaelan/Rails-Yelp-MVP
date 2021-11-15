class RestaurantsController < ApplicationController

  # GET/restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/:id
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # PUT /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant was successfully created'
    else
      render :new
    end
  end

  # GET /restaurants/id/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # PATCH /restaurants/id
  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)

    redirect_to restaurant_path(@restaurant), notice: 'Restaurant was successfully updated'
  end

  # DELETE /restaurants/id
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path, notice: 'Restaurant was successfully destroyed.'
  end

  private

  # Strong params
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
