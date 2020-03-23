class UsersController < ApplicationController
  before_action :set_user, only: %i[ destroy update ]
  skip_before_action :authorize_request, only: %i[ create ]

  def index
    users = User.all.as_json(except: [:password_digest])
    json_response(users)
  end

  def create
    user = User.create!(user_params)
    json_response(user, :created)
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
      params.permit(:first_name, :last_name, :email, :password, :student_class, :all_majors)
    end

    def set_user
      @user = User.find(params[:id])
    end
end