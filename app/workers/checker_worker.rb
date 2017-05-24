class CheckerWorker
  include Sidekiq::Worker

  def perform
    if EnvironmentSensor.get_soil_humidity < 30
      Pipe.start
      CheckerWorker.perform_in(1.minute)
    else
      Pipe.stop
    end

  end
end
