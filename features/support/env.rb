require 'watir'
require 'pry'
require 'yaml'
require 'slowhandcuke'
require './features/support/pages/page.rb' # Needs to be required before other page objects

USER_DATA = {}
YAML.load_file('./features/support/test_data/user_data.yml').each do |user|
  USER_DATA[user['email']] = user
end
