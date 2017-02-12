class Api::MoistureController < ApplicationController
  def show
    sensor = MoistureSensor.new
    @moisture = MoistureReport.new(value: sensor.get_value)

    render json: @moisture
  end
end
