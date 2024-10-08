class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attended_events, foreign_key: :event_attendee_id
  has_many :events_attended, through: :attended_events
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"
end
