class StaticPagesController < ApplicationController
  def index
    @moisture = MoistureReport.new(value: MoistureSensor.get_value)
  end
end
