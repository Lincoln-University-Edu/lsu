class SearchController < ApplicationController
  def academic_events
    paginate AcademicEvent.search_by_term(search_params), per_page: 15
  end

  def promotions
    paginate Promotion.search_by_term(search_params), per_page: 15
  end

  def entities
    paginate Entity.search_by_term(search_params), per_page: 15
  end

  def events
    paginate Event.search_by_term(search_params), per_page: 15
  end

  def entities
    paginate Entity.search_by_term(search_params), per_page: 15
  end

  def users
    paginate User.search_by_term(search_params), per_page: 15
  end

  def student_wires
    paginate StudentWire.search_by_term(search_params), per_page: 15
  end

  private
  
  def search_params
    params.permit(:search_term)
  end
end
