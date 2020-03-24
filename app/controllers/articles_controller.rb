class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ update destroy ]

  def index
   articles = Article.all.as_json(methods: :article_category)
   json_response(articles)
  end

  def create
    article = Article.create!(article_params).as_json(methods: :article_category)
    json_response(article, :created)
  end

  def update
    @article.update(article_params)
    head :no_content
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private
  def article_params
    params.permit(:author_name, :title, :body, :description, :cover_image, :article_keywords, :article_category, )
  end

  def set_article
    @article = Article.find(params[:id])
  end

  
end
