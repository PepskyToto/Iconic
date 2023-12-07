class AddForeignKeyConstraintWithCascade < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :bookings, :products, on_delete: :cascade
  end
end
