require 'watir'
require 'pry'
require 'yaml'
require 'slowhandcuke'

USER_DATA = {}
YAML.load_file('./features/test_data/user_data.yml').each do |user|
  USER_DATA[user['email']] = user
end
