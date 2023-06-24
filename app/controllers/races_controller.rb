class RacesController < ApplicationController
  
  def index
    @world = World.find(params[:world_id])
    @races = @world.races
  end

  def show
    @race = Race.find(params[:id])
    @world = @race.world
  end

  def new
    @race = Race.new
    @world = World.find(params[:world_id])
  end

  def create
    @race = Race.new(race_params)
    @world = World.find(params[:world_id])
    @race.world = @world
    if @race.save
      redirect_to race_path(@race)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @race = Race.find(params[:id])
  end

  def update
    @race = Race.find(params[:id])
    @race.update(race_params)
    redirect_to race_path(@race)
  end

  def destroy
    @race = Race.find(params[:id])
    @world = @race.world
    @race.destroy
    redirect_to world_races_path(@world)
  end

  private

  def race_params
    params.require(:race).permit(:name, :description, :world_id, :image)
  end

end
