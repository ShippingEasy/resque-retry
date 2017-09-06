require 'resque-retry/custom_scheduler'

require 'resque-scheduler'
require 'resque/plugins/retry/retry_via_resque_scheduler'
Resque.retry_scheduler = Resque::Plugins::Retry::RetryViaResqueScheduler.new(Resque)
