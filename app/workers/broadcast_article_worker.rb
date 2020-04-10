class BroadcastArticleWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(article)
    ActionCable.server.broadcast 'article_channel', article
  end
end