class HistoricalTimelinesController < ApplicationController

  def index
    @historical_timelines = HistoricalTimeline.all
  end

  def show
    @historical_timeline = HistoricalTimeline.find(params[:id])
  end

  def new
    @historical_timeline = HistoricalTimeline.new
  end

  def edit
    @historical_timeline = HistoricalTimeline.find(params[:id])
  end

  def create
    @historical_timeline = HistoricalTimeline.new(historical_timeline_params)

    if @historical_timeline.save
      redirect_to @historical_timeline
    else
      render 'new'
    end
  end

  def update
    @historical_timeline = HistoricalTimeline.find(params[:id])

    if @historical_timeline.update(historical_timeline_params)
      redirect_to @historical_timeline
    else
      render 'edit'
    end
  end

  def destroy
    @historical_timeline = HistoricalTimeline.find(params[:id])
    @historical_timeline.destroy

    redirect_to historical_timelines_path
  end

  private

  def historical_timeline_params
    params.require(:historical_timeline).permit(:name, :world_id)
  end
end
