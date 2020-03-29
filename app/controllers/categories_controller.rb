class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ destroy update ]

  def index
    paginate Category.all, per_page: 15
  end 

  def create
    category = Category.create!(category_params)
    json_response(category, :created)
  end

  def update
    @category.update(category_params)
    head :no_content
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private
  
  def set_category
    @category = Category.find_by!(id: params[:id])
  end

  def category_params
    params.permit(:name)
  end
end
