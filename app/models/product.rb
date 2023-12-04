class Product < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :bookings
  has_many :reviews
end
