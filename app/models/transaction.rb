class Transaction < ApplicationRecord
  validates :tdate, presence: true
  validates :amount, presence: true
  validates :category_id, presence: true
  validates :subcategory_id, presence: true
  validates :user_id, presence: true
  
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user
end
