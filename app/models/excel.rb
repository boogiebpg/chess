class Excel

  def check_format_and_save row
    if row[2].to_f>0
      p = Price.new
      p.update_attributes(:name => row[0], :description => row[1], :value => row[2])
      p.save!
      return 1
    else
      return 0
    end
  end
 
end
