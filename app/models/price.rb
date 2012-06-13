class Price < ActiveRecord::Base
  attr_accessible :description, :name, :value, :category_id
  
  has_many :pictures
  belongs_to :category
  
  validates_presence_of :name, :value

end
