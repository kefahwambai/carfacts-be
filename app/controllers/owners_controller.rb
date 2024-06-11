class OwnersController < ApplicationController
  # before_action :authenticate_request!
  # before_action :authorize_admin_or_service_center, only: [:create, :update, :destroy]

  def index
    vehicle = Vehicle.find(params[:vehicle_id])
    render json: vehicle.owners
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Vehicle not found' }, status: :not_found
  end

  def show
    @owner = Owner.find(params[:id])
    render json: @owner
  end

  def create
    @owner = Owner.new(owner_params)
    @owner.vehicle_id = params[:vehicle_id]
    if @owner.save
      render json: @owner, status: :created
    else
      render json: @owner.errors, status: :unprocessable_entity
    end
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update(owner_params)
      render json: @owner
    else
      render json: @owner.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy
  end

  private

  def owner_params
    params.permit(:name)
  end

  def authorize_admin_or_service_center
    unless @current_user.admin? || @current_user.service_center?
      render json: { error: "Not Authorized" }, status: :forbidden
    end
  end
end
