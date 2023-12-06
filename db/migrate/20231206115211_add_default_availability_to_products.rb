class AddDefaultAvailabilityToProducts < ActiveRecord::Migration[7.1]
  def change
    change_column :products, :availability, :boolean, default: true
  end
end
