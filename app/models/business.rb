class Business < ActiveRecord::Base

  validates_uniqueness_of :name
  validates_uniqueness_of :address
  validates_uniqueness_of :phone
  validates_uniqueness_of :website
  validates_uniqueness_of :uuid
  
end
