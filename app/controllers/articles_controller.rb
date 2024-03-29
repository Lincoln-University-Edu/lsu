class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show update destroy ]
  before_action :check_new_article_category, except: %i[ index update destroy ]
  before_action :check_existing_article_category, except: %i[ index create ]

  def index
   paginate Article.all, per_page: 15
  end

  def show
    json_response(@article)
  end

  def create
    article = Article.create!(article_params)
    
    BroadcastArticleWorker.perform_async(serialized_article(article))

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

  def serialized_article(article)
    ActiveModelSerializers::Adapter::Json.new(
      ArticleSerializer.new(article)
    ).serializable_hash
  end
  
  def article_params
    params.permit(:author_name, :title, :body, :description, :cover_image, :article_keywords, :article_category,)
  end

  def set_article
    @article = Article.find_by!(id: params[:id])
  end

  def check_new_article_category
    if params[:article_category] == "Lincolnian"
      raise(ExceptionHandler::AuthenticationError, 'You are not a Lincolnian Publisher') unless current_user.is_lincolnian_publisher
      return
    end

    if params[:article_category] == "Lincoln Press"
      raise(ExceptionHandler::AuthenticationError, 'You are not a Lincoln Press Publisher') unless current_user.is_lincoln_press_publisher
    end
  end

  def check_existing_article_category
    if @article.article_category == "Lincolnian"
      raise(ExceptionHandler::AuthenticationError, 'You are not a Lincolnian Publisher') unless current_user.is_lincolnian_publisher
      return
    end

    if @article.article_category == "Lincoln Press"
      raise(ExceptionHandler::AuthenticationError, 'You are not a Lincoln Press Publisher') unless current_user.is_lincoln_press_publisher
      return
    end
  end

end
