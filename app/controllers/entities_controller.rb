class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[ update destroy add_user remove_user]
  before_action :set_user, only: %i[ add_user remove_user ]

  def index
   paginate Entity.all, per_page: 15
  end

  def add_user
    @user.entities << @entity
  end

  def remove_user
    @entity.users.delete(@user)
  end

  def create
    entity = Entity.create!(entity_params)
    json_response(entity, :created)
  end

  def update
    @entity.update(entity_params)
    head :no_content
  end

  def destroy
    @entity.destroy
    head :no_content
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def set_user
    @user = User.find_by!(id: params[:user_id])
  end

  def entity_params
    params.permit(:name, :description, :email, :phone_number, :location, :is_office, :is_organisation)
  end
end
