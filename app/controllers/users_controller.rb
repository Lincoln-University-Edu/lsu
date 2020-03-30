class UsersController < ApplicationController
  before_action :set_user, only: %i[ show destroy update ]
  skip_before_action :authorize_request, only: %i[ create ]

  def index
    paginate User.all, per_page: 15
  end

  def show
    json_response(@user)
  end

  def create
    user = User.create!(user_params)
    result = AuthenticateUser.new(user.email, user.password).call
    json_response(result, :created)
  end

  def profile
    json_response(current_user)
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private
    def user_params
      params.permit(
        :first_name, 
        :last_name, 
        :email, 
        :password, 
        :student_class, 
        :all_majors, 
        :is_lincolian_press_publisher,
        :is_student_wire_editor,
        :is_student_life_event_publisher,
        :is_academic_event_publisher,
        :is_athletic_event_publisher,
      )
    end

    def set_user
      @user = User.find_by!(id: params[:id])
    end

end