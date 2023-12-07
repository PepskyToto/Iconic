class AddDetailsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :sexe, :string
    add_column :products, :couleurs, :string
    add_column :products, :textile_type, :string
  end
end
