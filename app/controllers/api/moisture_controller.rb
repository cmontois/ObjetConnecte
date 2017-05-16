class Api::MoistureController < ApplicationController
  def index
    @moisture = MoistureReport.new(value: MoistureSensor.get_value)

    render json: @moisture
  end
end
