class FixPriceColumns < ActiveRecord::Migration
  def self.up
    rename_column :prices, :name, :name_en
    rename_column :prices, :description, :description_en
  end

  def self.down
    
  end
end
