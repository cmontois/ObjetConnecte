require 'sidekiq/api'

Sidekiq::Queue.new.clear
Sidekiq::ScheduledSet.new.clear
Sidekiq::RetrySet.new.clear

ReportGeneratorWorker.perform_async
