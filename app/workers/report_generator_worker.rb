class ReportGeneratorWorker
  include Sidekiq::Worker

  def perform
    Report.create(
        soil_humidity: EnvironmentSensor.get_soil_humidity,
        air_humidity: EnvironmentSensor.get_air_humidity,
        pressure: EnvironmentSensor.get_pressure,
        temperature: EnvironmentSensor.get_temperature
    )

    CheckerWorker.perform_async

    ReportGeneratorWorker.perform_in(10.minutes)
  end
end
