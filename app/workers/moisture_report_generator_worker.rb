class MoistureReportGeneratorWorker
  include Sidekiq::Worker

  def perform()
    sensor = MoistureSensor.new
    MoistureReport.create(value: sensor.get_value)
    MoistureReportGeneratorWorker.perform_in(10.minutes)
  end
end
