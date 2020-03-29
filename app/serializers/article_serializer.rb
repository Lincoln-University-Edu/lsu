class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :article_category, :author_name, :title, :description, :body, :cover_image
end
