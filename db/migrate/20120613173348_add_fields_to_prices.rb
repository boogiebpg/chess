class AddFieldsToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :name_ru, :string
    add_column :prices, :description_ru, :string
  end
end
