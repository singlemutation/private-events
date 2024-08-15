class CreateAttendedEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :attended_events do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :event, foreign_key: true
      t.timestamps
    end
  end
end
