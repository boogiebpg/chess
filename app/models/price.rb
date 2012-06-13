class Price < ActiveRecord::Base
  attr_accessible :description_en, :name_en, :value, :category_id
  attr_accessible :description_ru, :name_ru

  has_many :pictures
  belongs_to :category
  
  validates_presence_of :name_ru, :name_en, :value

end
