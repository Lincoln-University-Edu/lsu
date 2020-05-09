class SearchController < ApplicationController

  def academic_events
    result = paginate AcademicEvent.search_by_term(search_params), per_page: 15
    BroadcastSearchWorker.perform_async(result, @current_user.id)
    if result
      return "Search Successful, results are on the way through your action cable connection!"
    end
  end

  def promotions
    result = paginate Promotion.search_by_term(search_params), per_page: 15
    BroadcastSearchWorker.perform_async(result, @current_user.id)
    if result
      return "Search Successful, results are on the way through your action cable connection!"
    end
  end

  def articles
    result = paginate Article.search_by_term(search_params), per_page: 15
    BroadcastSearchWorker.perform_async(result, @current_user.id)
    if result
      return "Search Successful, results are on the way through your action cable connection!"
    end
  end

  def events
    result = paginate Event.search_by_term(search_params), per_page: 15
    BroadcastSearchWorker.perform_async(result, @current_user.id)
    if result
      return "Search Successful, results are on the way through your action cable connection!"
    end
  end

  def entities
    result = paginate Entity.search_by_term(search_params), per_page: 15
    BroadcastSearchWorker.perform_async(result, @current_user.id)
    if result
      return "Search Successful, results are on the way through your action cable connection!"
    end
  end

  def users
    result = paginate User.search_by_term(search_params), per_page: 15
    BroadcastSearchWorker.perform_async(result, @current_user.id)
    if result
      return "Search Successful, results are on the way through your action cable connection!"
    end
  end

  def student_wires
    result = paginate StudentWire.search_by_term(search_params), per_page: 15
    BroadcastSearchWorker.perform_async(result, @current_user.id)
    if result
      return "Search Successful, results are on the way through your action cable connection!"
    end
  end

  private
  
  def search_params
    params[:search_term]
  end
end
