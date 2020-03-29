class PromotionsController < ApplicationController
  before_action :set_promotion, only: %i[ update destroy ]

  def index
   promotions = Promotion.all
   json_response(promotions)
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
    @promotion = @current_user.promotions.find(params[:id])
  end


  def promotion_params
    params.permit(:title, :description,:email, :phone_number,:price, :promotion_category, :condition)
  end
end
