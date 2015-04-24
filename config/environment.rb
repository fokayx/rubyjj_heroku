# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
app_secret = File.join(Rails.root, 'config', 'initializers', 'app_secret.rb')
load(app_secret) if File.exists?(app_secret)

Rails.application.initialize!
