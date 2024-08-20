class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @created_events = Event.where(creator_id: (params[:id]))
    @attended_events = Event.joins("INNER JOIN attended_events ON attended_events.event_attended_id = events.id INNER JOIN users ON users.id = event_attendee_id").where('users.id' => @user)
  end
end
