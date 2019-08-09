class Event < ApplicationRecord
    has_many :attends
    has_many :users, through: :attends
    validates :name, :date, :location, :details, presence: true
    #validates :date, numericality: {message: "%(value) must be included"}

    #accepts_nested_attributes_for :attends

    scope :order_by_date, -> {order(date: :asc)}

    scope :popular_event, -> {joins(:attends).group(:id).order('count(attends.id) desc').limit(1)}
  
    

end
