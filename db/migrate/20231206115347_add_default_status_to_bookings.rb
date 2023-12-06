class AddDefaultStatusToBookings < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :status, :boolean, default: true
  end
end
