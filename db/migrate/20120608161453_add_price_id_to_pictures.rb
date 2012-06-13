class AddPriceIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :price_id, :integer
  end
end
