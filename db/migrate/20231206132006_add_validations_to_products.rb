class AddValidationsToProducts < ActiveRecord::Migration[7.1]
  def change
    change_column :products, :description, :string, null: false
  end
end
