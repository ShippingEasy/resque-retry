require 'resque'

require 'resque/plugins/retry'
require 'resque/plugins/retry/extensions'
require 'resque/plugins/exponential_backoff'
require 'resque/failure/multiple_with_retry_suppression'
require 'resque-retry/version.rb'

Resque.extend Resque::Plugins::Retry::Extensions
