class SeriesController < ApplicationController

  def index
    @worlds = current_user.worlds
    
  end

  def show
    @series = Series.find(params[:id])
    @world = @series.world
    @books = @series.books
  end

  def new
    @series = Series.new
    @user = User.find(params[:user_id])
    @worlds = @user.worlds
  end

  def create
    @series = Series.new(series_params)
    @user = User.find(params[:user_id])
    if @series.save
      redirect_to @series
    else
      render :new
    end
  end

  def edit
    @series = Series.find(params[:id])
  end

  def update
    @series = Series.find(params[:id])
    if @series.update(series_params)
      redirect_to @series
    else
      render :edit
    end
  end

  def destroy
    @series = Series.find(params[:id])
    @series.destroy
    redirect_to series_index_path
  end

  private

  def series_params
    params.require(:series).permit(:name, :world_id)
  end
end
