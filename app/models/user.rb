class User < ApplicationRecord
    has_many :attends
    has_many :events, through: :attends
end
