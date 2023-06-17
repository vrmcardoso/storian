class MapsController < ApplicationController

  def index
    @world = World.find(params[:world_id])
    @maps = @world.maps
  end

  def show
    @map = Map.find(params[:id])
    @world = @map.world

  end

  def new
    @world = World.find(params[:world_id])
    @map = Map.new
  end

  def create
    @world = World.find(params[:world_id])
    @map = @world.maps.create(map_params)
    redirect_to world_maps_path(@world)
  end

  private

  def map_params
    params.require(:map).permit(:name, :world_id, :image)
  end
end
