module Resque
  module Plugins
    module Retry
      module Extensions
        def retry_scheduler
          @retry_scheduler
        end

        def retry_scheduler=(val)
          @retry_scheduler = val
        end
      end
    end
  end
end
