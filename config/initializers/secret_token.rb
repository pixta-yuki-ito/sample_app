# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '3fc214cb9d8aab2f0c5f14a51bdb7883a9f913572c4cf7b15d9ea2510e95ad2cb76b6b8266f4f3e6a4315cac5f8790ac4046a3d9ec0dfae6f693569821f99786'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    File.read(token_file).chomp
  else
    token = SecureRandom.hex(64)
    File.write(token_file, token)
  end
end

SampleApp::Application.config.secret_key_base = secure_token
