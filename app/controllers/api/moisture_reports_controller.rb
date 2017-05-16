class Api::MoistureReportsController < ApplicationController
  before_action :set_moisture_report, only: [:show]

  def index
    @moisture_reports = MoistureReport.all.last(10)

    render json: @moisture_reports
  end

  def show
  end

  private
  def set_moisture_report
    @moisture_report = MoistureReport.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def moisture_report_params
    params.require(:moisture_report).permit(:value)
  end
end
