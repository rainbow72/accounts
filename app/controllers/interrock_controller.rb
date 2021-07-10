class InterrockController < ApplicationController
  def index
    @categories = Category.all
    @subcategories = Subcategory.none
  end

  def subcategories
    @subcategories = Subcategory.where(category_id: params[:category_id]).pluck(:name, :id)
    @subcategories.unshift(["",""])
  end
end
