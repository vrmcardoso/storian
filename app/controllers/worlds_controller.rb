class WorldsController < ApplicationController
  def index
    @worlds = World.all
  end

  def show
    @world = World.find(params[:id])
    @series = @world.series
    @books = @world.books
    @books = @books.reject { |book| book.series.present? }
  end

  def new
    @world = World.new
  end

  def create
    @world = World.new(world_params)
    @world.user = current_user
    if @world.save
      redirect_to world_path(@world)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @world = World.find(params[:id])
  end

  def update
    @world = World.find(params[:id])
    @world.update(world_params)
    redirect_to world_path(@world)
  end

  def destroy
    @world = World.find(params[:id])
    @world.destroy
    redirect_to worlds_path
  end

  private

  def world_params
    params.require(:world).permit(:name, :description, :photo)
  end
end
