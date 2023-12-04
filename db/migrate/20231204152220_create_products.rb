class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.integer :size
      t.integer :price
      t.string :title
      t.string :description
      t.boolean :availability

      t.timestamps
    end
  end
end
