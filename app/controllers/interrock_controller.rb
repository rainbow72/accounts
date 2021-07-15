class InterrockController < ApplicationController
  def index
  end

  def subcategories
    @subcategories = Subcategory.where(category_id: params[:category_id])
    logger.debug(params[:category_id])
    @subcategories.each do |sub|
      logger.debug(sub.name)
    end
  end
end
