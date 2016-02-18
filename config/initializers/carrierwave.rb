CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['aws_access_key_id'],
    aws_secret_access_key: ENV['aws_secret_access_key'],
    region: ENV['aws_region']
  }
  config.fog_directory = 'cards_image'
  config.fog_public = false
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
end
