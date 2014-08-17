class Product < ActiveRecord::Base
  has_many :orderations
  has_many :orders, :through => :orderations
end
