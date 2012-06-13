class Excel

  def check_format_and_save row
    # check price
    if row[5].to_f>0
      p = Price.new

      # check category
      cat = Category.where(id: row[0]).first
      cat_id = (cat.nil? ? 0 : row[0])

      p.update_attributes(:category_id => cat_id, :name_en => row[1], :name_ru => row[2], :description_en => row[3], :description_ru => row[4], :value => row[5])
      p.save!
      return 1
    else
      return 0
    end
  end
 
end
