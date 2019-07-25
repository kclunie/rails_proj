class Attend < ApplicationRecord
  belongs_to :user
  belongs_to :event

  accepts_nested_attributes_for :user

  #scope :by_event, => (event_id) {where("event_id = ?", event_id)}

end
