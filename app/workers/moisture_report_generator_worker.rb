class MoistureReportGeneratorWorker
  include Sidekiq::Worker

  def perform
    MoistureReport.create(value: MoistureSensor.get_value)

    MoistureCheckerWorker.perform_async

    MoistureReportGeneratorWorker.perform_in(10.minutes)
  end
end
