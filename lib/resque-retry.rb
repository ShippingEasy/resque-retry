require 'resque'

require 'resque/plugins/retry'
require 'resque/plugins/retry/extensions'
require 'resque/plugins/exponential_backoff'
require 'resque/failure/multiple_with_retry_suppression'
require 'resque-retry/version.rb'

Resque.extend Resque::Plugins::Retry::Extensions

# Only when using resque-scheduler
require 'resque-scheduler'
require 'resque/plugins/retry/retry_via_resque_scheduler'
Resque.retry_scheduler = Resque::Plugins::Retry::RetryViaResqueScheduler.new(Resque)

