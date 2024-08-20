class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @created_events = Event.where(creator_id: (params[:id]))
  end
end
