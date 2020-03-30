class MajorsController < ApplicationController
  before_action :set_major, only: %i[ update destroy ]
  skip_before_action :authorize_request, only: %i[ index ]


  def index
   paginate Major.all, per_page: 15
  end

  def create
    major = Major.create!(major_params)
    json_response(major, :created)
  end

  def update
    @major.update(major_params)
    head :no_content
  end

  def destroy
    @major.destroy
    head :no_content
  end

  private

  def set_major
    @major = Major.find(params[:id])
  end

  def major_params
    params.permit(:name)
  end
end