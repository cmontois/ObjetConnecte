class MoistureCheckerWorker
  def perform
    if MoistureSensor.get_value < 30
      PIPE_PIN.on
    else
      PIPE_PIN.off
    end
  end
end
