class StudentWiresController < ApplicationController
  before_action :set_student_wire, only: %i[ update destroy ]

  def index
   student_wires = StudentWire.all
   json_response(student_wires)
  end

  def create
    student_wire = StudentWire.create!(student_wire_params)
    json_response(student_wire, :created)
  end

  def update
    @student_wire.update(student_wire_params)
    head :no_content
  end

  def destroy
    @student_wire.destroy
    head :no_content
  end

  private

  def set_student_wire
    @student_wire = StudentWire.find_by!(id: params[:id])
  end


  def student_wire_params
    params.permit( :contact, :title, :body, :cover_image, :external_link, :student_wire_keywords)
  end
end
