class Offer < ApplicationRecord
  validates_presence_of(:title, :content)
  validates_numericality_of :price, greater_than: 0, less_than: 100000
end