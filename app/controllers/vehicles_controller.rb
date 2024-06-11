class VehiclesController < ApplicationController
  # before_action :authenticate_request!
  # before_action :authorize_admin_or_service_center, only: [:create, :update, :destroy]

  def show
    vehicle = Vehicle.find(params[:id])
    render json: vehicle
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Vehicle not found' }, status: :not_found
  end

  def index
    vehicles = Vehicle.all
    render json: vehicles
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      render json: @vehicle, status: :created
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
  end

  private

  def vehicle_params
    params.permit(:vin, :make, :model, :year)
  end

  def authorize_admin_or_service_center
    unless @current_user.admin? || @current_user.service_center?
      render json: { error: "Not Authorized" }, status: :forbidden
    end
  end
end
