# require 'httplog'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :yahoo_oauth2, Rails.application.secrets.client_id, Rails.application.secrets.client_secret,
    name: 'yahoo'
end

# OmniAuth.config.logger = Rails.logger
# HttpLog.options[:logger] = Rails.logger
# puts "Client ID #{Rails.application.secrets.yahoo_client_id}"