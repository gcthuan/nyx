class Order < ActiveRecord::Base
  has_many :orderations
  has_many :products, :through => :orderations
end
