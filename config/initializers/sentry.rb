# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://65e61fa27c732025c9420b1c5ffd7188@o4506985247801344.ingest.us.sentry.io/4506985247932416';
  config.enable_tracing = true
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]
end
