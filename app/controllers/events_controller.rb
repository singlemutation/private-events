class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @creator = @event.creator
    @attendees = User.joins("INNER JOIN attended_events ON attended_events.event_attendee_id = users.id INNER JOIN events ON events.id = attended_events.event_attended_id").where('events.id' => @event)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @event = Event.find(params[:id])
    @attendee = current_user
    @event.attendees << @attendee
    redirect_to root_path, notice: 'Thanks for signing up!'
  end

  private

  def event_params
    params.require(:event).permit(:location, :date, :creator_id)
  end
end
