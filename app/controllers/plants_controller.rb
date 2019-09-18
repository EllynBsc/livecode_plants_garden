class PlantsController < ApplicationController
  def new
    # raise
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new(strong_params_plant)
    # @plant.garden_id = @garden.garden_id
    @plant.garden = @garden
    if @plant.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def destroy
    plant = Plant.find(params[:id])
    plant.destroy
    redirect_to garden_path(plant.garden)
  end
  private

  def strong_params_plant
    params.require(:plant).permit(:name, :image_url)
  end
end
