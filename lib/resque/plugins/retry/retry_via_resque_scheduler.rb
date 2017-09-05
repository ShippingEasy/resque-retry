module Resque
  module Plugins
    module Retry
      # We could just return an instance of Resque, but this helps document
      # the expected scheduler interface.
      class RetryViaResqueScheduler
        def initialize(resque)
          @resque = resque
        end

        def enqueue_in(time_offset, job, *args)
          @resque.enqueue_in(time_offset, job, *args)
        end

        def delayed_queue_peek(start, count)
          @resque.delayed_queue_peek(start, count)
        end

        def delayed_timestamp_peek(timestamp, start, count)
          @resque.delayed_timestamp_peek(timestamp, start, count)
        end

        def delayed_timestamp_size(timestamp)
          @resque.delayed_timestamp_size(timestamp)
        end

        def delayed_queue_schedule_size
          @resque.delayed_queue_schedule_size
        end

        def remove_delayed(job)
          klass = get_class(job)
          @resque.remove_delayed(klass, *job['args'])
        end

        private
        def get_class(job)
          Resque::Job.new(nil, nil).constantize(job['class'])
        end
      end
    end
  end
end
