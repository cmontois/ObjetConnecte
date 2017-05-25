class CheckerWorker
  include Sidekiq::Worker

  def perform
    if EnvironmentSensor.get_soil_humidity < 30
      Pipe.start

      History.create(verb: 'pipe:open', started_at: Time.now) unless History.where(verb: 'pipe:open', ended_at: nil).size > 0

      CheckerWorker.perform_in(1.minute)
    else
      Pipe.stop

      History.where(verb: 'pipe:open', ended_at: nil).update_all(ended_at: Time.now)
    end

  end

  private
  def get_variation

  end
end
