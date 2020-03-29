class KeywordsController < ApplicationController
  before_action :set_keyword, only: %i[ destroy update ]

  def index
    paginate Keyword.all, per_page: 15
  end 

  def create
    keyword = Keyword.create!(keyword_params)
    json_response(keyword, :created)
  end

  def update
    @keyword.update(keyword_params)
    head :no_content
  end

  def destroy
    @keyword.destroy
    head :no_content
  end

  private
  
  def set_keyword
    @keyword = Keyword.find_by!(id: params[:id])
  end

  def keyword_params
    params.permit(:name)
  end
end
