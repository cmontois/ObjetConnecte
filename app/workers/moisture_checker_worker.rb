class MoistureCheckerWorker
  include Sidekiq::Worker

  def perform
    if MoistureSensor.get_value < 30
      Pipe.start
      MoistureCheckerWorker.perform_in(1.minute)
    else
      Pipe.stop
    end

  end
end
