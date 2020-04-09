class StudentWiresController < ApplicationController
  before_action :set_student_wire, only: %i[ show update destroy ]
  before_action :check_student_wire_authorization, except: %i[ index ]

  def index
    paginate StudentWire.all, per_page: 15
  end

  def create
    student_wire = StudentWire.create!(student_wire_params)

    serialized_student_wire = ActiveModelSerializers::Adapter::Json.new(
      StudentWireSerializer.new(student_wire)
    ).serializable_hash

    BroadcastStudentWireWorker.perform_async(serialized_student_wire)

    json_response(student_wire, :created)
  end

  def show
    json_response(@student_wire)
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

  def check_student_wire_authorization
    unless current_user.is_student_wire_editor
      raise(ExceptionHandler::AuthenticationError, 'You are not a student wire editor')
    end
  end
end
