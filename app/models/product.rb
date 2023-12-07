class Product < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :bookings
  has_many :reviews

  validates :category, presence: true
  validates :size, presence: true
  validates :price, presence: true
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 6 }
  validates :availability, inclusion: { in: [true, false] }

  after_initialize :set_default_availability

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
  against: [ :title, :description ],
  using: {
    tsearch: { prefix: true }
  }

  private

  def set_default_availability
    self.availability ||= true if new_record?
  end
end
