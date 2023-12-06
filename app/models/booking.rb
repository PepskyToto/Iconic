class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: [true, false] }

  after_initialize :set_default_status

  private

  def set_default_status
    self.status ||= true if new_record?
  end
end
