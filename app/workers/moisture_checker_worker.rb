class MoistureCheckerWorker
  include Sidekiq::Worker

  def perform
    if MoistureSensor.get_value < 30
      Pipe.start
    else
      Pipe.stop
    end
  end
end
