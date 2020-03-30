class PromotionsController < ApplicationController
  before_action :set_promotion, only: %i[ show update destroy ]

  def index
    paginate Promotion.all, per_page: 15
  end

  def show
    json_response(@promotion)
  end

  def create
    promotion = @current_user.promotions.create!(promotion_params)
    json_response(promotion, :created)
  end

  def update
    @promotion.update(promotion_params)
    head :no_content
  end

  def destroy
    @promotion.destroy
    head :no_content
  end

  private

  def set_promotion
    @promotion = @current_user.promotions.find_by!(id: params[:id])
  end


  def promotion_params
    params.permit(:title, :description,:email, :phone_number,:price, :promotion_category, :condition, :promotion_image_urls)
  end
end
