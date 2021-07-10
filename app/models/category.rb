class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  
  has_many :transactions
  has_many :subcategories
  
  default_scope -> { order(:id) }
end
