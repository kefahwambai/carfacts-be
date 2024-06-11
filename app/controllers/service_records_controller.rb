class ServiceRecordsController < ApplicationController
  # before_action :authenticate_request!
  # before_action :authorize_admin_or_service_center, only: [:create, :update, :destroy]

  def index
    @service_records = ServiceRecord.where(vehicle_id: params[:vehicle_id])
    render json: @service_records
  end

  def show
    @service_record = ServiceRecord.find(params[:id])
    render json: @service_record
  end

  def create
    @service_record = ServiceRecord.new(service_record_params)
    @service_record.vehicle_id = params[:vehicle_id]
    if @service_record.save
      render json: @service_record, status: :created
    else
      render json: @service_record.errors, status: :unprocessable_entity
    end
  end

  def update
    @service_record = ServiceRecord.find(params[:id])
    if @service_record.update(service_record_params)
      render json: @service_record
    else
      render json: @service_record.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @service_record = ServiceRecord.find(params[:id])
    @service_record.destroy
  end

  private

  def service_record_params
    params.permit(:description, :date)
  end

  def authorize_admin_or_service_center
    unless @current_user.admin? || @current_user.service_center?
      render json: { error: "Not Authorized" }, status: :forbidden
    end
  end
end
