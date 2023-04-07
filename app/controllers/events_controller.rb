class EventsController < ApplicationController
  before_action :set_historical_timeline
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = @historical_timeline.events
  end

  def show
  end

  def new
    @event = @historical_timeline.events.build
  end

  def create
    @event = @historical_timeline.events.build(event_params)
    if @event.save
      redirect_to historical_timeline_event_path(@historical_timeline, @event), notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to historical_timeline_event_path(@historical_timeline, @event), notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to historical_timeline_events_path(@historical_timeline), notice: 'Event was successfully destroyed.'
  end

  private

  def set_historical_timeline
    @historical_timeline = HistoricalTimeline.find(params[:historical_timeline_id])
  end

  def set_event
    @event = @historical_timeline.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:description, :date)
  end
end
