class Attend < ApplicationRecord
  belongs_to :user
  belongs_to :event

  #accepts_nested_attributes_for :user

  validates :guest, presence: true
  #scope :by_event, => (event_id) {where("event_id = ?", event_id)}

  validate :not_a_duplicate

  def not_a_duplicate
    if Attend.find_by(user_id: user_id, event_id: event_id)
      errors.add("attend", "you have already RSVPd")
    end
  end


end
