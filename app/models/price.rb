class Price < ActiveRecord::Base
  attr_accessible :description, :name, :value
  
  has_many :pictures
  
end
