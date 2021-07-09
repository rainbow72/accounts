class Subcategory < ApplicationRecord
  validates :subcategory, presence: true, length: { maximum: 255 }
  validates :category_id, presence: true
  belongs_to :category
  has_many :transactions, dependent: :restrict_with_exception
end
