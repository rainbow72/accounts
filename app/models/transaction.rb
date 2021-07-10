class Transaction < ApplicationRecord
  validates :tdate, presence: true
  validates :amount, presence: true
  validates :category_id, presence: true
  validates :subcategory_id, presence: true
  validates :user_id, presence: true
  
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user
  
  scope :ssearch, ->(search_params) do
    return if search_params.blank?
    
    keyword_like(search_params[:keyword])
    .category_id_is(search_params[:category_id])
    .subcategory_id_is(search_params[:subcategory_id])
  end
  scope :keyword_like, -> (keyword) { where("description LIKE ? or title LIKE ", "%#(keyword)%", "%#(keyword%") if keyword.present? }
  scope :category_id_is, -> (category_id) { where(category_id: category_id) if category_id.present? }
  scope :subcategory_id_is, -> (subcategory_id) { where(subcategory_id: subcategory_id) if subcategory_id.present? }
end
