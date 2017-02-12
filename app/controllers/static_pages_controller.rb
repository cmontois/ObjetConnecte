class StaticPagesController < ApplicationController
  def index
    sensor = MoistureSensor.new
    @moisture = MoistureReport.new(value: sensor.get_value)
  end
end
