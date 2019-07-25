class Event < ApplicationRecord
    has_many :attends
    has_many :users, through: :attends
    validates :name, :date, :location, :details, presence: true



end
