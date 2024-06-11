class AccidentReportsController < ApplicationController
  # before_action :authenticate_request!
  # before_action :authorize_admin_or_service_center, only: [:create, :update, :destroy]

  def index
    @accident_reports = AccidentReport.where(vehicle_id: params[:vehicle_id])
    render json: @accident_reports
  end

  def show
    @accident_report = AccidentReport.find(params[:id])
    render json: @accident_report
  end

  def create
    @accident_report = AccidentReport.new(accident_report_params)
    @accident_report.vehicle_id = params[:vehicle_id]
    if @accident_report.save
      render json: @accident_report, status: :created
    else
      render json: @accident_report.errors, status: :unprocessable_entity
    end
  end

  def update
    @accident_report = AccidentReport.find(params[:id])
    if @accident_report.update(accident_report_params)
      render json: @accident_report
    else
      render json: @accident_report.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @accident_report = AccidentReport.find(params[:id])
    @accident_report.destroy
  end

  private

  def accident_report_params
    params.permit(:description, :date)
  end

  def authorize_admin_or_service_center
    unless @current_user.admin? || @current_user.service_center?
      render json: { error: "Not Authorized" }, status: :forbidden
    end
  end
end
