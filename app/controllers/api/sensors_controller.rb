class Api::SensorsController < ApplicationController
  def index
    render json: {
        air_humidity: EnvironmentSensor.get_air_humidity,
        temperature: EnvironmentSensor.get_temperature,
        pressure: EnvironmentSensor.get_pressure,
        soil_humidity: EnvironmentSensor.get_soil_humidity
    }
  end
end
