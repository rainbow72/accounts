class InterrockController < ApplicationController
  def index
  end

  def subcategories
    @subcategories = Subcategory.where(category_id: params[:category_id])
  end
end
