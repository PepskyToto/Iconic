class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :rating, presence: true
  validates :comment, presence: true
end
