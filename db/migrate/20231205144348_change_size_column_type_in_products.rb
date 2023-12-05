class ChangeSizeColumnTypeInProducts < ActiveRecord::Migration[7.1]
  def change
    change_column :products, :size, :string
  end
end
