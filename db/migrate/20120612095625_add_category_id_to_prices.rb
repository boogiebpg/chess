class AddCategoryIdToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :category_id, :integer
  end
end
