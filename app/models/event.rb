class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attended_events, foreign_key: :event_attended_id
  has_many :attendees, through: :attended_events, source: :event_attendee

  scope :past, -> { where("date < ?", Time.now) }
  scope :future, -> {where("date > ?", Time.now) }

end
