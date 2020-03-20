class MajorsController < ApplicationController
  before_action :set_major, only: %i[ update destroy ]

  def index
   majors = Major.all
   json_response(majors)
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