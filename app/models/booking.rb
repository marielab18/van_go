class Booking < ApplicationRecord
  belongs_to :van
  belongs_to :user
  has_many :reviews
end
