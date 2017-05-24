class Api::TemperatureController < ApplicationController
    def show
      @temperature = EnvironmentSensor.get_temperature

      render json: @temperature
    end
end