# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins 'http://localhost:3000' # Adjust to your frontend domain
#     resource '*', 
#       headers: :any, 
#       methods: [:get, :post, :put, :patch, :delete, :options],
#       credentials: true # Allows sending cookies/auth tokens
#   end
# end

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000', 'https://genzdeveloper.com' # Allow local dev and production domain
    resource '*', 
      headers: :any, 
      methods: [:get, :post, :put, :patch, :delete, :options],
      credentials: true # Allows sending cookies/auth tokens
  end
end
