class Product < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews

  validates :sexe, presence: true
  validates :couleurs, presence: true
  validates :textile_type, presence: true
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

  scope :filter_by_size, ->(size) { where(size: size) if size.present? }
  scope :filter_by_category, ->(category) { where(category: category) if category.present? }
  scope :filter_by_sexe, ->(sexe) { where(sexe: sexe) if sexe.present? }
  scope :filter_by_couleurs, ->(couleurs) { where(couleurs: couleurs) if couleurs.present? }
  scope :filter_by_textile_type, ->(textile_type) { where(textile_type: textile_type) if textile_type.present? }


  private

  def set_default_availability
    self.availability ||= true if new_record?
  end
end
