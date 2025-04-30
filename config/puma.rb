# Puma configuration for production deployment

# Set the number of threads to use (min and max are the same here)
threads_count = ENV.fetch("RAILS_MAX_THREADS", 5).to_i
threads threads_count, threads_count

# Define the port Puma will listen on (Railway provides this via ENV["PORT"])
port ENV.fetch("PORT", 3000)

# Set the environment (default to production)
environment ENV.fetch("RAILS_ENV") { "production" }

# Use multiple workers for concurrency (optional, depends on your app size/memory)
workers ENV.fetch("WEB_CONCURRENCY", 2)

# Preload the app before forking workers for better memory usage
preload_app!

# Allow Puma to be restarted by `bin/rails restart`
plugin :tmp_restart

# Enable Solid Queue if flagged
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# Use a custom PID file if provided
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]
