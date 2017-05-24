class Api::PressureController < ApplicationController
  def show
    @pressure = EnvironmentSensor.get_pressure

    render json: @pressure
  end
end