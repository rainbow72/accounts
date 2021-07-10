class Subcategory < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :category_id, presence: true

  belongs_to :category
  has_many :transactions
  
  default_scope -> { (order(:id)) }
end
