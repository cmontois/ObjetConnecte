class Api::AirHumidityController < ApplicationController
  def show
    @air_humidity = EnvironmentSensor.get_humidity

    render json: @air_humidity
  end
end