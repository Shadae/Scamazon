CarrierWave.configure do |config|

  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    # config.root = "#{Rails.root}/tmp"
 
  elsif Rails.env.production?
  config.storage = :fog
  config.fog_credentials = { 
    :provider               => 'AWS', 
    :aws_access_key_id      => ENV['AWS_KEY'], 
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY'] 
  } 
  config.fog_directory  = ENV['bucket']
  config.fog_public     = false 
  end

end