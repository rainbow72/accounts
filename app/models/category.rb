class Category < ApplicationRecord
  validates :category, presence: true, length: { maximum: 255 }
  
  has_many :transactions, dependent: :restrict_with_exception
  has_many :subcategories, dependent: :destroy
end
