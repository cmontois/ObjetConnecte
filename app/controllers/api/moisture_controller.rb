class Api::MoistureController < ApplicationController
  def show
    @moisture = MoistureReport.new(value: MoistureSensor.get_value)

    render json: @moisture
  end
end
