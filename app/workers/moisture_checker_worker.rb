class MoistureCheckerWorker
  def perform
    sensor = MoistureSensor.new
    value = sensor.get_value

    if value < 30
      PIPE_PIN.on
    else
      PIPE_PIN.off
    end
  end
end