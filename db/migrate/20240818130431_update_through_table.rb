class UpdateThroughTable < ActiveRecord::Migration[7.1]
  def up
    change_table :attended_events do |t|
      t.rename :user_id, :event_attendee_id
      t.rename :event_id, :event_attended_id
    end
  end
end
